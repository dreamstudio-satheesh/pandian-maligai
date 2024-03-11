<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index('user_id_sales');
			$table->dateTime('date');
            $table->unsignedBigInteger('customer_id')->index('sale_customer');
            $table->string('invoice_number')->unique();
            $table->integer('warehouse_id')->nullable()->default(0);
            $table->float('tax_rate', 10, 0)->nullable()->default(0);
			$table->float('tax_amount', 10, 0)->nullable()->default(0);
			$table->float('discount', 10, 0)->nullable()->default(0);
			$table->string('discount_type', 192);
			$table->float('grand_total', 10, 0)->default(0);
			$table->float('paid_amount', 10, 0)->default(0);
			$table->float('shipping_amount', 10, 0)->nullable()->default(0);
			$table->string('payment_status', 192);
			$table->string('status', 191);
			$table->text('notes')->nullable();
            $table->unsignedBigInteger('deleted_by')->nullable();
			$table->softDeletes();
            $table->timestamps();


           
            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales');
    }
};
