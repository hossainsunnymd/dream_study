<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $fillable = [
        'country_name',
        'country_flag',
        'rank'
    ];

    public function countryDetail(){
        return $this->hasOne(CountryDetail::class);
    }
}
