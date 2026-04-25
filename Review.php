<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    protected $table = 'review';
    protected $primaryKey = 'id_review';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id_review',
        'id_pelanggan',
        'id_lahan',
        'rating',
        'komentar',
        'tanggal_review',
    ];
}