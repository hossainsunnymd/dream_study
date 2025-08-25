<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    protected $fillable=[
        'image',
        'meta_title',
        'meta_description',
        'description',
        'title',
        'page_name_id',
    ];

    public function pageName(){
        return $this->belongsTo(PageName::class);
    }
}
