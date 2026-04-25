<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lahan extends Model
{
    use HasFactory;

    protected $table = 'lahan';
    protected $primaryKey = 'id_lahan';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id_lahan',
        'id_admin',
        'nama_lahan',
        'lokasi_lahan',
        'luas_lahan',
        'jenis_tanah',
        'sumber_air',
        'harga_sewa',
        'deskripsi_lahan',
        'status_lahan',
        'foto_lahan',
        'nama_pemilik',
        'nohp_pemilik',
    ];
}
