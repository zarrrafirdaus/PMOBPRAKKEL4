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
        Schema::create('penyewaan', function (Blueprint $table) {
            $table->char('id_sewa', 10)->primary();
            $table->char('id_lahan', 10);
            $table->char('id_pelanggan', 10);
            $table->date('tanggal_mulai');
            $table->date('tanggal_selesai');
            $table->integer('durasi_sewa');
            $table->decimal('total_biaya', 10, 2);
            $table->string('status_sewa', 15);
            $table->timestamps();

            $table->foreign('id_lahan')->references('id_lahan')->on('lahan')->onDelete('cascade');
            $table->foreign('id_pelanggan')->references('id_pelanggan')->on('pelanggan')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penyewaan');
    }
};
