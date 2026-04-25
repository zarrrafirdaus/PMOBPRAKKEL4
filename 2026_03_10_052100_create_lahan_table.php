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
        Schema::create('lahan', function (Blueprint $table) {
            $table->char('id_lahan', 10)->primary();
            $table->char('id_admin', 10);
            $table->string('nama_lahan', 30);
            $table->string('lokasi_lahan', 30);
            $table->string('luas_lahan', 30);
            $table->string('jenis_tanah', 20);
            $table->string('sumber_air', 20);
            $table->decimal('harga_sewa', 10, 2);
            $table->longText('deskripsi_lahan')->nullable();
            $table->smallInteger('status_lahan')->default(0);
            $table->string('foto_lahan', 50)->nullable();
            $table->string('nama_pemilik', 30);
            $table->char('nohp_pemilik', 16);
            $table->timestamps();

            $table->foreign('id_admin')->references('id_admin')->on('admin')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lahan');
    }
};