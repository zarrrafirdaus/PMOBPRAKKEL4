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
        Schema::create('pelanggan', function (Blueprint $table) {
            $table->char('id_pelanggan', 10)->primary();
            $table->string('nama_pelanggan', 30);
            $table->string('email_pelanggan', 30);
            $table->string('password_pelanggan', 100);
            $table->char('nohp_pelanggan', 16);
            $table->string('alamat_pelanggan', 50);
            $table->date('tanggal_daftar');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pelanggan');
    }
};