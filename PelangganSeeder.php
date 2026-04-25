<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class PelangganSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('pelanggan')->insert([
            [
                'id_pelanggan' => 'PEL001',
                'nama_pelanggan' => 'Andi',
                'email_pelanggan' => 'andi@example.com',
                'password_pelanggan' => Hash::make('andi123'),
                'nohp_pelanggan' => '081122334455',
                'alamat_pelanggan' => 'Surabaya',
                'tanggal_daftar' => now(),
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}
