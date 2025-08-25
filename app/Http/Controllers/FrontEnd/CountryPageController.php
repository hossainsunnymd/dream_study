<?php

namespace App\Http\Controllers\FrontEnd;

use Inertia\Inertia;
use App\Models\Country;
use App\Models\University;
use Illuminate\Http\Request;
use App\Models\CountryDetail;
use App\Models\SuccessStories;
use App\Http\Controllers\Controller;

class CountryPageController extends Controller
{
    //country by id
    public function countryById($id)
    {
        $country = CountryDetail::find($id);
        $countries = Country::orderBy('country_name', 'asc')->get();
        $universities=University::where('country_id','=',$id)->with('country')->orderBy('rank', 'asc')->get();
        return Inertia::render('FrontEnd/CountrySelectByIDPage', [
            'country' => $country,
            'countries' => $countries,
            'universities' => $universities
        ]);
    }
}
