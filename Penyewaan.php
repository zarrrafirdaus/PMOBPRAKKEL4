<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penyewaan extends Model
{
    use HasFactory;

    protected $table = 'penyewaan';
    protected $primaryKey = 'id_sewa';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id_sewa',
        'id_lahan',
        'id_pelanggan',
        'tanggal_mulai',
        'tanggal_selesai',
        'durasi_sewa',
        'total_biaya',
        'status_sewa',
    ];
}
