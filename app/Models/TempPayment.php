<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TempPayment extends Model
{
    protected $fillable = [
        'session_id',
        'data',
        'status',
    ];
}
