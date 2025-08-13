<?php

namespace App\Http\Controllers\BackEnd;

use Inertia\Inertia;
use App\Models\Country;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\CountrySaveRequest;

class CountryController extends Controller
{
    //country list
    public function countryList(Request $request)
    {
        $countries = Country::all();
        return Inertia::render('BackEnd/Country/CountryListPage', ['countries' => $countries]);
    }

    //country save page
    public function countrySavePage(Request $request)
    {
        $country = Country::find($request->country_id);
        return Inertia::render('BackEnd/Country/CountrySavePage', ['country' => $country]);
    }

    //country save
    public function countrySave(CountrySaveRequest $request)
    {
        $data = [
            'country_name' => $request->country_name,
            'rank' => $request->rank
        ];
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('country', $imageName);
            $data['country_flag'] = $imageName;
        }
        Country::create($data);
        return redirect()->back()->with(['status' => true, 'message' => 'Country Saved Successfully']);
    }

    //country update
    public function countryUpdate(CountrySaveRequest $request, $country_id)
    {


        $data = [
            'country_name' => $request->country_name,
            'rank' => $request->rank
        ];


        $country = Country::findOrFail($country_id);

        if ($request->hasFile('image')) {

            if ($country->country_flag && Storage::exists('country/' . $country->country_flag)) {
                Storage::delete('country/' . $country->country_flag);
            }

            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('country', $imageName);
            $data['country_flag'] = $imageName;
        }

        $country->update($data);

        return redirect()->back()->with(['status' => true, 'message' => 'Country Updated Successfully']);
    }

    //delete country
    public function countryDelete($country_id)
    {
        $country = Country::findOrFail($country_id);
        if ($country->country_flag && Storage::exists('country/' . $country->country_flag)) {
            Storage::delete('country/' . $country->country_flag);
        }
        $country->delete();
        return redirect()->back()->with(['status' => true, 'message' => 'Country Deleted Successfully']);
    }

}
