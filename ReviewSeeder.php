<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReviewSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('review')->insert([
            [
                'id_review' => 'REV001',
                'id_pelanggan' => 'PEL001',
                'id_lahan' => 'LH001',
                'rating' => 5,
                'komentar' => 'Lahan sangat baik dan cocok untuk bercocok tanam',
                'tanggal_review' => now(),
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}