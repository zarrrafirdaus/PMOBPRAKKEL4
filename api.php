<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\LahanController;
use App\Http\Controllers\PenyewaanController;
use App\Http\Controllers\PembayaranController;
use App\Http\Controllers\ReviewController;

// Admin
Route::apiResource('admin', AdminController::class);

// Pelanggan
Route::apiResource('pelanggan', PelangganController::class);

// Lahan
Route::apiResource('lahan', LahanController::class);

// Penyewaan
Route::apiResource('penyewaan', PenyewaanController::class);

// Pembayaran
Route::apiResource('pembayaran', PembayaranController::class);

// Review
Route::apiResource('review', ReviewController::class);
