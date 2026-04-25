<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('admin')->insert([
            [
                'id_admin' => 'ADM001',
                'nama_admin' => 'NFR',
                'email_admin' => 'nfr@admin.com',
                'password_admin' => Hash::make('nfr123'),
                'nohp_admin' => '081234567890',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}