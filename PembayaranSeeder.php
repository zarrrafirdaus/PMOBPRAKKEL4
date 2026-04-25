<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PembayaranSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('pembayaran')->insert([
            [
                'id_pembayaran' => 'PAY001',
                'id_sewa' => 'SEWA001',
                'metode_pembayaran' => 'Transfer Bank',
                'tanggal_pembayaran' => now(),
                'jumlah_pembayaran' => 500000.00,
                'status_pembayaran' => 'lunas',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}