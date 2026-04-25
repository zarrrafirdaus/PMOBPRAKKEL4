<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LahanSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('lahan')->insert([
            [
                'id_lahan' => 'LH001',
                'id_admin' => 'ADM001',
                'nama_lahan' => 'Lahan Pertanian Surabaya',
                'lokasi_lahan' => 'Surabaya',
                'luas_lahan' => '500 m2',
                'jenis_tanah' => 'Lempung',
                'sumber_air' => 'Sumur',
                'harga_sewa' => 500000.00,
                'deskripsi_lahan' => 'Cocok untuk pertanian hortikultura',
                'status_lahan' => 1,
                'foto_lahan' => 'default.jpg',
                'nama_pemilik' => 'Subarjo',
                'nohp_pemilik' => '081234567890',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}