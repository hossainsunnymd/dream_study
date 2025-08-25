<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentReview extends Model
{
    protected $fillable=[
        'name',
        'title',
        'image',
        'description',
        'rating',
        'rank'
    ];
}
