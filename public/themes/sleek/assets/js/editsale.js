// Function to calculate the discount
function calculateDiscount(discountType, discountAmount) {
    if (discountType === "fixed") {
        return discountAmount;
    } else if (discountType === "percent") {
        // Ensure discountAmount is less than or equal to 90 for 'percent' type
        if (discountAmount > 90) {
            throw new Error(
                "Discount amount cannot exceed 90 for percent type."
            );
        }

        return (discountAmount / 100) * totalWithoutTaxAndShipping;
    }
    return 0;
}

function calculateTax(taxRate) {
    if (taxRate === 0 || isNaN(taxRate)) {
        return 0;
    }
    return (taxRate / 100) * (totalWithoutTaxAndShipping - calculateDiscount(document.getElementById("discountType").value, parseFloat(document.getElementById("discountAmount").value) || 0));
}

// Function to update grand total
function updateGrandTotal() {
    const taxRateElement = document.getElementById("taxRate");
    const shippingAmountElement = document.getElementById("shippingAmount");
    const discountTypeElement = document.getElementById("discountType");
    const discountAmountElement = document.getElementById("discountAmount");

    // Ensure discountAmount and discountType have valid values, else default to 0 and 'fixed'
    const discountType =
        discountTypeElement && discountTypeElement.value
            ? discountTypeElement.value
            : "fixed";
    const discountAmount =
        discountAmountElement && discountAmountElement.value
            ? parseFloat(discountAmountElement.value) || 0
            : 0;
    const taxRate =
        taxRateElement && taxRateElement.value
            ? parseFloat(taxRateElement.value) || 0
            : 0;
    const shippingAmount = parseFloat(shippingAmountElement.value) || 0;

    const discount = calculateDiscount(discountType, discountAmount);
     tax = calculateTax(taxRate);
    // Calculate grandTotal
     grandTotal =
        totalWithoutTaxAndShipping - discount + tax + shippingAmount;

    // Update the display for discount, tax, and grand total
    const displayDiscountElement = document.getElementById("display_discount");
    const displayTaxElement = document.getElementById("display_tax");
    const grandTotalElement = document.getElementById("grandTotal");
    const displayShippingElement = document.getElementById("display_shipping");

    // Update display for shipping
    if (displayShippingElement) {
        const displayShippingValue = isNaN(shippingAmount) ? 0 : shippingAmount;
        displayShippingElement.textContent = `₹ ${displayShippingValue.toFixed(
            2
        )}`;
    }

    if (displayDiscountElement)
        displayDiscountElement.textContent = `₹ ${(+discount).toFixed(2)} (${
            discountType === "percent" ? discountAmount + "%" : "Fixed"
        })`;
    if (displayTaxElement)
        displayTaxElement.textContent = `₹ ${(+tax).toFixed(2)} (${taxRate}%)`;
    if (grandTotalElement)
        grandTotalElement.textContent = `₹ ${(+grandTotal).toFixed(2)}`;
}

function updateWeight(productIdentifier, newWeight, item, weightInput) {
    const itemIndex = cart.findIndex(item => item.productIdentifier === productIdentifier);
   if (itemIndex !== -1 && !isNaN(newWeight) && parseFloat(newWeight) > 0) {
        newWeight = parseFloat(newWeight);  // Ensure newWeight is a number

        // Check if the new weight is already a number with up to 3 decimal places
        const roundedWeight = parseFloat(newWeight.toFixed(3));
        if (newWeight !== roundedWeight) {
            console.warn("New weight has more than 3 decimal places, rounding to 3 decimal places");
            newWeight = roundedWeight;
        }

        cart[itemIndex].weight = newWeight;

        // Retrieve the unit details
        const unit = item.units ? item.units.find(u => u.id === item.selectedUnit?.id) : null;

        let adjustedWeight = newWeight;
        if (unit) {
            const operatorValue = parseFloat(unit.operator_value);
            if (isNaN(operatorValue)) {
                console.error("Invalid operator value:", unit.operator_value);
                return;
            }

            // Apply the operator and operator_value to the new weight
            switch (unit.operator) {
                case '*':
                    adjustedWeight = newWeight * operatorValue;
                    break;
                case '/':
                    adjustedWeight = newWeight / operatorValue;
                    break;
                case '+':
                    adjustedWeight = newWeight + operatorValue;
                    break;
                case '-':
                    adjustedWeight = newWeight - operatorValue;
                    break;
                default:
                    console.error("Unsupported operator:", unit.operator);
                    return;
            }

            // Update the selected unit in the cart item
            cart[itemIndex].selectedUnit = unit;
        } else {
            console.warn("Unit not found, defaulting to new weight calculation");
            cart[itemIndex].selectedUnit = null; // or handle appropriately
        }

        // Ensure productPrice is set
        const productPrice = parseFloat(cart[itemIndex].productPrice);
        if (isNaN(productPrice)) {
            console.error("Invalid original price:", cart[itemIndex].productPrice);
            return;
        }

        const newPrice = productPrice * adjustedWeight; // New price for the weight

        // Ensure newPrice is a number before updating
        if (!isNaN(newPrice)) {
            // Update the subtotal for this item
            cart[itemIndex].subtotal = (cart[itemIndex].quantity * newPrice).toFixed(2);

            // Update the weight input in case it wasn't formatted on input
            weightInput.value = newWeight;

            // Update the cart table, which should recalculate the grand total
            updateCartTable();
        } else {
            console.error("Calculation error: newPrice is NaN");
        }
    } else {
        console.error("Invalid weight or item not found");
    }
}


function updatePrice(productIdentifier, newPrice) {
    newPrice = parseFloat(newPrice);
    const productIndex = cart.findIndex(
        (item) => item.productIdentifier === productIdentifier
    );
    if (productIndex !== -1 && !isNaN(newPrice) && newPrice > 0) {
        cart[productIndex].productPrice = newPrice;
        cart[productIndex].subtotal = (
            cart[productIndex].quantity * newPrice
        ).toFixed(2);
        updateCartTable();
    }
}

function incrementQuantity(productIdentifier) {
    const productIndex = cart.findIndex(
        (item) => item.productIdentifier === productIdentifier
    );
    if (productIndex !== -1) {
        const productInCart = cart[productIndex];
        const potentialNewQuantity = productInCart.quantity + 1;

        if (
            stocksModuleEnabled &&
            productInCart.stock !== null &&
            potentialNewQuantity > productInCart.stock
        ) {
            toastr.error("Cannot add more. Not enough stock.");
            return;
        }

        updateProductQuantity(productIdentifier, 1);
    }
}

function decrementQuantity(productIdentifier) {
    updateProductQuantity(productIdentifier, -1);
}

function updateQuantity(productIdentifier, newQuantity) {
    newQuantity = parseInt(newQuantity, 10);
    const productIndex = cart.findIndex(
        (item) => item.productIdentifier === productIdentifier
    );

    if (productIndex !== -1 && !isNaN(newQuantity) && newQuantity > 0) {
        const productInCart = cart[productIndex];

        // Check if the stocks module is enabled and if stock information is available
        if (stocksModuleEnabled && productInCart.stock !== null) {
            // Check if the new quantity exceeds available stock
            if (newQuantity > productInCart.stock) {
                toastr.error("Cannot update quantity. Not enough stock.");
                return;
            }
        }

        cart[productIndex].quantity = newQuantity;
        cart[productIndex].subtotal = (
            newQuantity * productInCart.productPrice
        ).toFixed(2);
        updateCartTable();
    }
}

function updateProductQuantity(
    productIdentifier,
    change = 0,
    newQuantity = null
) {
    const productIndex = cart.findIndex(
        (item) => item.productIdentifier === productIdentifier
    );

    if (productIndex !== -1) {
        if (newQuantity !== null) {
            cart[productIndex].quantity = newQuantity;
        } else {
            cart[productIndex].quantity += change;
        }
        cart[productIndex].quantity = Math.max(1, cart[productIndex].quantity); // Ensure quantity doesn't go below 1
        cart[productIndex].subtotal = (
            cart[productIndex].quantity * cart[productIndex].productPrice
        ).toFixed(2);
        updateCartTable(); // Re-render the cart table UI
    }
}

function removeFromCart(productIdentifier) {
    cart = cart.filter((item) => item.productIdentifier !== productIdentifier);
    updateCartTable();
}

function debounce(func, timeout = 1200) {
    let timer;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => {
            func.apply(this, args);
        }, timeout);
    };
}

function addToCart(product) {
    const productIdentifier = product.variant_id
        ? `${product.id}-${product.variant_id}`
        : `${product.id}`;
    const existingProductIndex = cart.findIndex(
        (item) => item.productIdentifier === productIdentifier
    );

    // If the stocks module is enabled and the stock is less than one, display an error message.
    if (stocksModuleEnabled && (product.stock < 1 || product.stock === null)) {
        toastr.error(
            "Cannot add to cart, product is out of stock or stock data is unavailable."
        );
        return;
    }

    if (existingProductIndex !== -1) {
        // Product exists, increase quantity if stock permits or if stock module is not enabled
        const potentialNewQuantity = cart[existingProductIndex].quantity + 1;
        if (
            !stocksModuleEnabled ||
            (stocksModuleEnabled && product.stock >= potentialNewQuantity)
        ) {
            cart[existingProductIndex].quantity = potentialNewQuantity;
            cart[existingProductIndex].subtotal = (
                cart[existingProductIndex].quantity *
                cart[existingProductIndex].productPrice
            ).toFixed(2);
        } else {
            toastr.error("Cannot add more. Not enough stock.");
            return;
        }
    } else {
        // New product, add to cart if stock permits or if stock module is not enabled
        if (
            !stocksModuleEnabled ||
            (stocksModuleEnabled && product.stock >= 1)
        ) {
            const newCartItem = {
                productId: product.id,
                productIdentifier: productIdentifier,
                productName: product.name,
                productPrice: parseFloat(product.price),
                quantity: 1,
                subtotal: parseFloat(product.price),
                stock: stocksModuleEnabled ? parseInt(product.stock, 10) : null,
                variantId: product.variant_id,
            };
            cart.push(newCartItem);
        } else {
            toastr.error("Cannot add to cart, product is out of stock !");
            return;
        }
    }
    updateCartTable();
}

// Function to update cart table in UI
function updateCartTable() {
    const tableBody = document.querySelector(".my-table tbody");

    // Clear existing table rows
    tableBody.innerHTML = "";

    // Reset totalWithoutTaxAndShipping before recalculating
    totalWithoutTaxAndShipping = 0;

    // If cart is empty, show 'No data available'
    if (cart.length === 0) {
        tableBody.innerHTML = '<tr><td colspan="9">No data Available</td></tr>';
        updateGrandTotal();
        return;
    }

    // Add each cart item as a row in the table
    cart.forEach((item) => {
        const row = document.createElement("tr");

        // Product Name
        const nameCell = document.createElement("td");
        nameCell.textContent = item.productName;
        row.appendChild(nameCell);

        // Units Dropdown
        const unitSelect = document.createElement("select");
        unitSelect.classList.add("form-control", "input-sm");

        if (Array.isArray(item.units) && item.units.length > 0) {
            item.units.forEach((unit) => {
                const option = document.createElement("option");
                option.value = unit.id;
                option.text = unit.short_name;
                if (unit.id === item.selectedUnit?.id) {
                    option.selected = true;
                }
                unitSelect.appendChild(option);
            });
        } else {
            // Handle the case where there are no units available
            const option = document.createElement("option");
            option.value = "";
            option.text = "No units available";
            unitSelect.appendChild(option);
        }

        // Add event listener for change
        unitSelect.addEventListener("change", (event) => {
            const selectedUnitId = event.target.value;
            if (Array.isArray(item.units)) {
                item.selectedUnit = item.units.find((unit) => unit.id == selectedUnitId);
            } else {
                item.selectedUnit = null; // or handle appropriately
            }
            
            // Recalculate the weight and update the subtotal
            updateWeight(item.productIdentifier, item.weight, item, weightInput);
        });

        // Append the select element to the cell and the row
        const unitCell = document.createElement("td");
        unitCell.appendChild(unitSelect);
        row.appendChild(unitCell);

        // Weight Input
        const weightInput = document.createElement("input");
        weightInput.type = "text";
        weightInput.classList.add("form-control", "input-sm", "weight-input");
        weightInput.value = parseFloat(item.weight);
        weightInput.addEventListener(
            "input",
            debounce((event) => {
                updateWeight(item.productIdentifier, event.target.value, item, weightInput);
            }, 500)
        );

        const weightCell = document.createElement("td");
        weightCell.appendChild(weightInput);
        row.appendChild(weightCell);

        // Price Input
        const priceInput = document.createElement("input");
        priceInput.type = "text";
        priceInput.classList.add("form-control", "input-sm", "price-input");
        priceInput.value = item.productPrice;
        priceInput.addEventListener(
            "input",
            debounce((event) => {
                updatePrice(item.productIdentifier, event.target.value);
            })
        );

        const priceCell = document.createElement("td");
        priceCell.appendChild(priceInput);
        row.appendChild(priceCell);

        

        // Stock Cell (only if stocksModuleEnabled is true)
        if (stocksModuleEnabled) {
            const stockCell = document.createElement("td");
            stockCell.textContent = item.stock !== null ? item.stock : "N/A";
            row.appendChild(stockCell);
        }

        // Subtotal
        const subtotalCell = document.createElement("td");
        subtotalCell.textContent = item.subtotal;
        row.appendChild(subtotalCell);

        // Add subtotal to totalWithoutTaxAndShipping
        const itemSubtotalNumber = parseFloat(item.subtotal);
        if (!isNaN(itemSubtotalNumber)) {
            totalWithoutTaxAndShipping += itemSubtotalNumber;
        } else {
            console.error('Invalid subtotal for item', item.productIdentifier, ':', item.subtotal);
        }

        // Remove Button
        const removeButton = document.createElement("button");
        removeButton.classList.add("btn", "btn-sm", "btn-danger");
        removeButton.textContent = "X";
        removeButton.addEventListener("click", () => {
            removeFromCart(item.productIdentifier);
        });

        const actionCell = document.createElement("td");
        actionCell.appendChild(removeButton);
        row.appendChild(actionCell);

        // Append the row to the table body
        tableBody.appendChild(row);
    });

    // Update the grand total after cart is updated
    updateGrandTotal();
}

// Call this function on page load to show the current cart
document.addEventListener("DOMContentLoaded", function () {

    // Update each cart item's subtotal in the cart array
    if (Array.isArray(cart)) {
        cart.forEach((item, index) => {
            // 1. Validate and process the weight
            let weight = parseFloat(item.weight);
            if (isNaN(weight) || weight <= 0) {
                console.error("Invalid weight for item", item.productIdentifier);
                return; // Skip updating this item if weight is invalid
            }
            // Round weight to 3 decimal places (like in updateWeight)
            weight = parseFloat(weight.toFixed(3));

            // 2. Determine the adjusted weight based on the selected unit
            let adjustedWeight = weight;
            if (item.units && Array.isArray(item.units) && item.selectedUnit) {
                // Find the selected unit details
                const unit = item.units.find(u => u.id == item.selectedUnit.id);
                if (unit) {
                    const operatorValue = parseFloat(unit.operator_value);
                    if (isNaN(operatorValue)) {
                        console.error("Invalid operator value for item", item.productIdentifier, ":", unit.operator_value);
                    } else {
                        switch (unit.operator) {
                            case '*':
                                adjustedWeight = weight * operatorValue;
                                break;
                            case '/':
                                adjustedWeight = weight / operatorValue;
                                break;
                            case '+':
                                adjustedWeight = weight + operatorValue;
                                break;
                            case '-':
                                adjustedWeight = weight - operatorValue;
                                break;
                            default:
                                console.error("Unsupported operator for item", item.productIdentifier, ":", unit.operator);
                        }
                    }
                } else {
                    console.warn("Selected unit not found for item", item.productIdentifier, "; using original weight.");
                }
            }

            // 3. Parse productPrice and quantity
            const productPrice = parseFloat(item.productPrice);
            const quantity = parseInt(item.quantity, 10);
            if (isNaN(productPrice) || isNaN(quantity) || quantity < 1) {
                console.error("Invalid productPrice or quantity for item", item.productIdentifier);
                return;
            }

            // 4. Calculate the new price (productPrice * adjustedWeight)
            const newPrice = productPrice * adjustedWeight;
            // 5. Update the item's subtotal in the cart array
            cart[index].subtotal = (newPrice * quantity).toFixed(2);
        });
    } else {
        console.warn("Cart is not an array.");
    }


    // disable the warehouseSelect dropdown so can manage item stock
    if (warehousesModuleEnabled) {
        document.getElementById("warehouseSelect").disabled = true;
    }

    updateCartTable();

    document
        .getElementById("discountType")
        ?.addEventListener("change", updateGrandTotal);
    document
        .getElementById("discountAmount")
        ?.addEventListener("input", updateGrandTotal);
    document
        .getElementById("taxRate")
        ?.addEventListener("input", updateGrandTotal);
    document
        .getElementById("shippingAmount")
        ?.addEventListener("input", updateGrandTotal);
});

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-box");

    searchInput.addEventListener("input", function (e) {
        const query = e.target.value;
        if (warehousesModuleEnabled) {
            var warehouseId = document.getElementById("warehouseSelect").value;
        }

        if (query.length < 2) {
            return;
        }

      
        let url = `/search-products?query=${query}`;

        if (stocksModuleEnabled && warehouseId) {
            url += `&warehouse_id=${warehouseId}`;
        }

        fetch(url)
            .then((response) => response.json())
            .then((products) => {
                displaySearchResults(products);
            })
            .catch((error) => console.error("Error:", error));
    });

    function displaySearchResults(products) {
        document.getElementById('search-box').value = '';

        const searchResultsDiv = document.getElementById("searchResults");
        searchResultsDiv.innerHTML = "";
        const ul = document.createElement("ul");
        ul.classList.add("list-group");

        products.forEach((product) => {
            const li = document.createElement("li");
            li.classList.add("list-group-item");
            let productText = product.name + " - " + product.price;
            if (stocksModuleEnabled && product.current_stock !== undefined) {
                productText += " - Stock: " + product.current_stock;
            }
            li.textContent = productText;
            li.setAttribute("data-product-id", product.id);
            li.setAttribute("data-product-name", product.name);
            li.setAttribute("data-product-price", product.price);
            li.setAttribute("data-variant-id", product.variant_id || "");
            if (stocksModuleEnabled) {
                li.setAttribute("data-product-stock", product.current_stock);
            }
            li.addEventListener("click", function () {
                const productToAdd = {
                    id: li.getAttribute("data-product-id"),
                    name: li.getAttribute("data-product-name"),
                    price: li.getAttribute("data-product-price"),
                    variant_id: li.getAttribute("data-variant-id"),
                    stock: stocksModuleEnabled
                        ? li.getAttribute("data-product-stock")
                        : null,
                };

                addToCart(productToAdd);
                searchResultsDiv.innerHTML = "";
            });
            ul.appendChild(li);
        });
        searchResultsDiv.appendChild(ul);
    }
});

$(document).ready(function () {
    $("#saleForm").on("submit", function (e) {
        e.preventDefault();

        // Prepare form data
        const formData = {
            _token: $('meta[name="csrf-token"]').attr("content"),
            customer_id: $("#customerDropdown").val(),
            sale_date: $('input[name="inv_datetime"]').val(),
            cart: cart.map((item) => ({
                productId: item.productId,
                quantity: item.quantity,
                UnitId: item.selectedUnit ? item.selectedUnit.id : null, // Add this line
                variantId: item.variantId,
                weight: item.weight,       
                subtotal: item.subtotal,     
                productPrice: item.productPrice,
                // ... add other product details as needed
            })),
            discount_type: $("#discountType").val(),
            discount: parseFloat($("#discountAmount").val()) || 0,
            tax_rate: parseFloat($("#taxRate").val()) || 0,
            tax_amount: parseFloat(tax.toFixed(2)) || 0,
            shipping_amount: parseFloat($("#shippingAmount").val()) || 0,
            total_amount: parseFloat(grandTotal.toFixed(2)) || 0,
        };

        
        

       
        // Post data to the server
          $.ajax({
            url: EditSaleUrl,
            type: "POST",
            data: formData,
            success: function (response) {
                // Show toastr success message
                toastr.success(response.message);
                window.location.href = SaleslistPage
               // location.reload(); // Refresh the page
            },
            error: function (xhr, status, error) {
                console.error(error);
                toastr.error("Error occurred while creating the sale.");
                // Handle error, show error messages
            },
        });  
    });

    
});
