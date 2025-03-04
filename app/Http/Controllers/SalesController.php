<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Models\Product;
use App\Models\Customer;
use App\Models\Warehouse;
use App\Models\SalesReturn;
use App\Exports\SalesExport;
use Illuminate\Http\Request;
use App\Exports\SalesExportPDF;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Exports\SalesReturnExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\SalesReturnExportPDF;
use Illuminate\Support\Facades\Validator;
use App\Http\Traits\HandlesSalesOperations;

class SalesController extends Controller
{
    use HandlesSalesOperations;

    public function __construct()
    {
        $this->middleware('can:view_sales')->only('index');
        $this->middleware('can:create_sales')->only(['create', 'createSale']);
        $this->middleware('can:edit_sales')->only(['edit', 'editSale']);
        // $this->middleware('can:delete_sales')->only('destroy');
    }

    public function index()
    {
        return view('sales.index');
    }

    public function show($id)
    {
        $sale = Sale::with(['items.product', 'customer', 'warehouse'])->find($id);
        if ($sale) {
            return view('sales.show', compact('sale'));
        }
        abort(404);
    }

    public function return_show($id)
    {
        $salesreturn = SalesReturn::with(['items.product', 'customer', 'warehouse'])->find($id);
        if ($salesreturn) {
            return view('salesreturn.show', compact('salesreturn'));
        }
        abort(404);
    }

    public function customer_type(Request $request)
    {
        $customerType = $request->input('type'); // Retrieve the customer type from the request

        // Set the customer type in the session
        session(['customer_type' => $customerType]);

        return $request->all();
    }

    public function create()
    {
        $customers = Customer::select('id', 'name', 'phone')->get();
        $warehouses = Warehouse::all();
        return view('sales.create', compact('customers', 'warehouses'));
    }

    public function sales_return()
    {
        return view('salesreturn.index');
    }

    public function create_return(Sale $sale)
    {
        $sales = $sale->load('items.product');

        foreach ($sales->items as $item) {
            $warehouse_id = $sale->warehouse_id;
            $variant_id = $item->variant_id ?? null;
        }

        $cartItems = $sales->items
            ->map(function ($item) use ($sale) {
                // Concatenate product_id and variant_id (if exists) for a unique identifier
                $productIdentifier = $item->variant_id ? $item->product_id . '-' . $item->variant_id : $item->product_id;
                // Append variant info to product name if variant_id exists
                $productName = $item->variant_id ? $item->product->name . ' - ' . $item->variant->name : $item->product->name;

                return [
                    'productId' => (string) $item->product_id,
                    'productIdentifier' => (string) $productIdentifier,
                    'productName' => $productName,
                    'productPrice' => (float) $item->price,
                    'quantity' => 0,
                    'availableQuantity' => (int) $item->quantity,
                    'variantId' => $item->variant_id ? (string) $item->variant_id : null,
                    'subtotal' => (float) 0.0,
                ];
            })
            ->toJson();

        return view('salesreturn.create_return', compact('sales', 'cartItems'));
    }

    public function search(Request $request)
    {
        $query = $request->input('query');
        $warehouse_id = $request->input('warehouse_id', 1);

        // Eager load the baseUnit and subUnits relationships
        $products = Product::where('name', 'like', '%' . $query . '%')
            ->orWhere('sku', 'like', $query . '%')
            ->with(['baseUnit', 'subUnits'])
            ->get();

        $transformedProducts = collect();
        foreach ($products as $product) {
            if (session('customer_type') == 'wholesale') {
                $product->price = $product->cost; // Set the price to cost if wholesale
            }
            $product->current_stock = $this->calculateCurrentStock($product->id, null, $warehouse_id);

            // Collect all units (base unit and sub-units)
            $allUnits = collect([$product->baseUnit])->merge($product->subUnits);

            // Transform the product to include all details and units information
            $transformedProduct = [
                'id' => $product->id,
                'name' => $product->name,
                'sku' => $product->sku,
                'price' => $product->price,
                'current_stock' => $product->current_stock,
                'units' => $allUnits,
            ];

            $transformedProducts->push($transformedProduct);
        }

        return response()->json($transformedProducts);
    }

    public function edit(Sale $sale)
    {
        $customers = Customer::select('id', 'name', 'phone')->get();
        $warehouses = Warehouse::all();
        $sales = $sale->load('items.product');

        foreach ($sales->items as $item) {
            $warehouse_id = $sale->warehouse_id;
            $variant_id = $item->variant_id ?? null;
            $item->current_stock = $this->calculateCurrentStock($item->product_id, $variant_id, $warehouse_id);
        }

        $cartItems = $sales->items
            ->map(function ($item) use ($sale) {
                // Concatenate product_id and variant_id (if exists) for a unique identifier
                $productIdentifier = $item->variant_id ? $item->product_id . '-' . $item->variant_id : $item->product_id;
                // Append variant info to product name if variant_id exists
                $productName = $item->variant_id ? $item->product->name . ' - ' . $item->variant->name : $item->product->name;

                // Load units: combine baseUnit and subUnits
                $units = collect();
                if ($item->product->baseUnit) {
                    $units->push($item->product->baseUnit);
                }
                if ($item->product->subUnits) {
                    $units = $units->merge($item->product->subUnits);
                }

                // Find the selected unit using the unit_id from the sale item
                $selectedUnit = $units->firstWhere('id', $item->unit_id);

                return [
                    'productId' => (string) $item->product_id,
                    'productIdentifier' => (string) $productIdentifier,
                    'productName' => $productName,
                    'productPrice' => (float) $item->price,
                    'quantity' => (int) $item->quantity,
                    'weight' => (float) $item->weight,
                    'variantId' => $item->variant_id ? (string) $item->variant_id : null,
                    'stock' => (float) $item->current_stock,
                    'units'           => $units->toArray(),  // Pass available units
                    'selectedUnit'    => $selectedUnit ? $selectedUnit->toArray() : null, // For pre-selection
                ];
            })
            ->toJson();
        // return $sales;
        return view('sales.edit', compact('customers', 'warehouses', 'sales', 'cartItems'));
    }

    public function edit_return($id)
    {
        $salesreturn = SalesReturn::find($id);

        if (!$salesreturn) {
            // Handle the case where SalesReturn is not found
            return back()->withErrors(['msg' => 'SalesReturn not found.']);
        }

        $sales = Sale::find($salesreturn->sale_id);
        if (!$sales) {
            // Handle the case where Sale is not found
            return back()->withErrors(['msg' => 'Sale not found.']);
        }

        $sales->load('items.product');

        // Assuming salesreturn->items is available and has a similar structure to sales->items
        // This map will help us quickly find a returned quantity for a given product and variant
        $returnedItemsMap = $salesreturn->items->mapWithKeys(function ($item) {
            $key = $item->variant_id ? $item->product_id . '-' . $item->variant_id : $item->product_id;
            return [$key => $item->quantity]; // Assuming each item has a 'quantity' attribute
        });

        $cartItems = $sales->items
            ->map(function ($item) use ($returnedItemsMap) {
                $productIdentifier = $item->variant_id ? $item->product_id . '-' . $item->variant_id : $item->product_id;

                $productName = $item->variant_id ? $item->product->name . ' - ' . $item->variant->name : $item->product->name;

                // Fetch the returned quantity from the map, defaulting to 0 if not found
                $returnedQuantity = $returnedItemsMap->get($productIdentifier, 0);

                return [
                    'productId' => (string) $item->product_id,
                    'productIdentifier' => (string) $productIdentifier,
                    'productName' => $productName,
                    'productPrice' => (float) $item->price,
                    'quantity' => (int) $returnedQuantity, // Use the returned quantity here
                    'availableQuantity' => (int) $item->quantity,
                    'variantId' => $item->variant_id ? (string) $item->variant_id : null,
                    'subtotal' => (float) ($item->price * $returnedQuantity), // Calculate subtotal based on returned quantity
                ];
            })
            ->toJson();

        return view('salesreturn.edit_return', compact('sales', 'cartItems', 'salesreturn')); // Include salesreturn if needed in view
    }

    public function update(Request $request, Sale $sale)
    {
        // Validation and update logic
        // ...

        return redirect()->route('sales.index')->with('success', 'Sale updated successfully');
    }

    public function restore($id)
    {
        $sale = Sale::withTrashed()->findOrFail($id);
        $sale->restore();
        return redirect()->route('sales.index')->with('success', 'Sale restored successfully.');
    }

    public function export($type)
    {
        if ($type == 'excel') {
            return Excel::download(new SalesExport(), 'sales.xlsx');
        } elseif ($type == 'csv') {
            return Excel::download(new SalesExport(), 'sales.csv', \Maatwebsite\Excel\Excel::CSV);
        } elseif ($type == 'pdf') {
            return Excel::download(new SalesExportPDF(), 'sales.pdf', \Maatwebsite\Excel\Excel::DOMPDF);
        }
    }

    public function export_return($type)
    {
        if ($type == 'excel') {
            return Excel::download(new SalesReturnExport(), 'sales_return.xlsx');
        } elseif ($type == 'csv') {
            return Excel::download(new SalesReturnExport(), 'sales_return.csv', \Maatwebsite\Excel\Excel::CSV);
        } elseif ($type == 'pdf') {
            return Excel::download(new SalesReturnExportPDF(), 'sales_return.pdf', \Maatwebsite\Excel\Excel::DOMPDF);
        }
    }

    public function download($invoiceId)
    {
        $sale = Sale::with(['items.product', 'customer', 'warehouse'])->find($invoiceId);
        // Ensure you have the invoice. Redirect or abort if not found.

        Pdf::setOption(['dpi' => 150, 'defaultFont' => 'sans-serif']);

        $pdf = PDF::loadView('pdf.sale', compact('sale'));

        return $pdf->download('invoice-' . $invoiceId . '.pdf');
    }

    public function download_return($invoiceId)
    {
        $sale = SalesReturn::with(['items.product', 'customer', 'warehouse'])->find($invoiceId);
        // Ensure you have the invoice. Redirect or abort if not found.

        Pdf::setOption(['dpi' => 150, 'defaultFont' => 'sans-serif']);

        $pdf = PDF::loadView('pdf.salereturn', compact('sale'));

        return $pdf->download('invoice-' . $invoiceId . '.pdf');
    }
}
