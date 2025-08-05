<?php

namespace App\Http\Controllers\FrontEnd;

use Inertia\Inertia;
use App\Models\Country;
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
        $countries = Country::all();
        $successStories = SuccessStories::all();
        return Inertia::render('FrontEnd/CountrySelectByIDPage', [
            'country' => $country,
            'countries' => $countries,
            'successStories' => $successStories
        ]);
    }
}
