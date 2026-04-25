<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PenyewaanSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('penyewaan')->insert([
            [
                'id_sewa' => 'SEWA001',
                'id_lahan' => 'LH001',
                'id_pelanggan' => 'PEL001',
                'tanggal_mulai' => now(),
                'tanggal_selesai' => now()->addDays(7),
                'durasi_sewa' => 7,
                'total_biaya' => 500000.00,
                'status_sewa' => 'aktif',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}