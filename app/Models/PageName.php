<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageName extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'rank'
    ];

    public function pages(){
        return $this->hasOne(Page::class);
    }
}
