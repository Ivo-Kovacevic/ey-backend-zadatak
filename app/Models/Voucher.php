<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    use HasFactory;

    protected $fillable = [
        'voucher_number',
        'voucher_provider',
        'voucher_amount',
        'expires_at',
        'used',
    ];

    protected $casts = [
        'used' => 'boolean',
    ];
}
