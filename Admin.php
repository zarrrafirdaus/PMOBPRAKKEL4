<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    use HasFactory;

    protected $table = 'admin'; // pastikan nama tabel sesuai
    protected $primaryKey = 'id_admin';
    public $incrementing = false; // karena id pakai CHAR, bukan auto-increment
    protected $keyType = 'string';

    protected $fillable = [
        'id_admin',
        'nama_admin',
        'email_admin',
        'password_admin',
        'nohp_admin',
    ];
}
