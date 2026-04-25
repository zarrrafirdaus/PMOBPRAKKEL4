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
        Schema::create('review', function (Blueprint $table) {
            $table->char('id_review', 10)->primary();
            $table->char('id_pelanggan', 10);
            $table->char('id_lahan', 10);
            $table->integer('rating');
            $table->longText('komentar')->nullable();
            $table->timestamp('tanggal_review')->useCurrent();
            $table->timestamps();

            $table->foreign('id_pelanggan')->references('id_pelanggan')->on('pelanggan')->onDelete('cascade');
            $table->foreign('id_lahan')->references('id_lahan')->on('lahan')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('review');
    }
};
