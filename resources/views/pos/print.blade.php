<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="keywords" content="bill , receipt, ">
    <meta name="author" content="ElitePOS">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>POS - invoice Page </title>

    <!-- Style -->
    <link href="{{ assets('assets/css/pos.css') }}" rel="stylesheet" />
</head>

<body class="section-bg-one">

    <main class="container receipt-wrapper" id="download-section">
        <div class="receipt-top">
            <div class="company-name">{{ config('settings.company_name') }}</div>
            <div class="company-address">{{ config('settings.company_address') }}</div>
            <div class="company-mobile">
                @if (trim(config('settings.company_phone')) !== '')
                    Phone: {{ config('settings.company_phone') }}
                @elseif (trim(config('settings.company_email')) !== '')
                    Email: {{ config('settings.company_email') }}
                @endif
            </div>
            <div> Customer name :  {{ $invoice->customer->name }}</div>
        </div>
        <div class="receipt-body">
            <div class="receipt-heading"><span>cash memo</span></div>
            <ul class="text-list text-style1">
                <li>
                    <div class="text-list-title">Date:</div>
                    <div class="text-list-desc">{{ \Carbon\Carbon::parse($invoice->date)->format('d/m/Y') }}</div>
                </li>
                <li class="text-right">
                    <div class="text-list-title">Time:</div>
                    <div class="text-list-desc">{{ \Carbon\Carbon::parse($invoice->date)->format('h:i A') }}</div>
                </li>
                <li>
                    <div class="text-list-title">Branch:</div>
                    <div class="text-list-desc">{{ $invoice->warehouse->name }} </div>
                </li>
                <li class="text-right">
                    <div class="text-list-title">Invoice:</div>
                    <div class="text-list-desc">#{{ $invoice->invoice_number }}</div>
                </li>
               
            </ul>
            <table class="receipt-table">
                <thead>
                    <tr>
                        <th>Price</th>
                        <th>Name</th>
                        <th>Unit</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($invoice->items as $item)
                        <tr class="text-receipt-seperator">
                            <td>{{ number_format($item->product->price, 2) }}</td>
                            <td style="font-size: small;"> {{ $item->product->name_ta }}</td>
                            <td style="font-size: small;">
                                <?php
                                    // Assume $item->weight holds the weight value
                                    $weight = $item->weight;

                                    // Convert the weight to a float to handle decimal places correctly
                                    $formattedWeight = floatval($weight);

                                    // Convert back to string and remove unnecessary trailing zeros
                                    $formattedWeight = rtrim(rtrim(sprintf('%f', $formattedWeight), '0'), '.');

                                    // Check if the weight has a decimal part
                                    if (strpos($formattedWeight, '.') !== false) {
                                        // Ensure the decimal part has at least one digit
                                        $formattedWeight = number_format((float) $formattedWeight, 2);
                                        $formattedWeight = rtrim(rtrim($formattedWeight, '0'), '.');
                                    }
                                   
                                    ?>
                                    {{ $formattedWeight }} 
                                @if($item->unit)
                                    {{ $item->unit->short_name }}
                                @else
                                    N/A
                                @endif
                            </td>
                            <td>{{ number_format($item->subtotal, 2) }}</td>
                           
                        </tr>
                    @endforeach

                </tbody>
            </table>
            <div class="text-bill-list mb-15">
                <div class="text-bill-list-in">
                    <div class="text-bill-title">Sub-Total:</div>
                    <div class="text-bill-value">{{ config('settings.currency_symbol') }} {{ number_format(ceil($subtotal), 0) }}</div>
                </div>
                <div class="text-bill-list-in">
                    <div class="text-bill-title">Discount: </div>
                    <div class="text-bill-value">-{{ config('settings.currency_symbol') }} {{ $discount }}</div>
                </div>
               {{--  <div class="text-receipt-seperator"></div>

                <div class="text-bill-list-in">
                    <div class="text-bill-title">Tax({{ $invoice->tax_rate }}%):</div>
                    <div class="text-bill-value">{{ config('settings.currency_symbol') }} {{ $invoice->tax_amount }}
                    </div>
                </div> --}}
                <div class="text-receipt-seperator"></div>
                <div class="text-bill-list-in">
                    <div class="text-bill-title">Total Items: {{ $invoice->items->count() }}</div>
               
                    <div class="text-bill-value"> Toatl: {{ config('settings.currency_symbol') }} {{ number_format(ceil($invoice->grand_total),0) }}
                    </div>
                </div>
               {{--  <div class="text-bill-list-in">
                    <div class="text-bill-title">Due :</div>
                    <div class="text-bill-value">{{ config('settings.currency_symbol') }}
                        {{ $invoice->grand_total - $invoice->paid_amount }}</div>
                </div>

                <div class="text-receipt-seperator"></div>
                <div class="text-bill-list-in">
                    <div class="text-bill-title">Cash paid</div>
                    <div class="text-bill-value">{{ config('settings.currency_symbol') }} {{ $invoice->paid_amount }}
                    </div>
                </div> --}}

            </div>

            <!-- Return Policy -->
            <div class="mb-10">
                <h4 class="mt-4 mb-2 text-title font-700 receipt-top"> Thank you for shopping with us </h4>
            </div>

            {{-- 
            <div class="mb-0">
                <h4 class="mb-2 text-title font-700 text-border"> Recycle Offer </h4>
                <p>Recycle shopping bag & get cash for each bag and discount on your purchase </p>
            </div> --}}
        </div>
    </main>


</body>

</html>
