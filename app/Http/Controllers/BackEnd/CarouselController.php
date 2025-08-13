<?php

namespace App\Http\Controllers\BackEnd;

use Inertia\Inertia;
use App\Models\Carousel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\CarouselSaveRequest;

class CarouselController extends Controller
{
    //carousel list
    public function carouselList(Request $request)
    {
        $carousels = Carousel::orderBy('rank', 'asc')->get();
        return Inertia::render('BackEnd/Carousel/CarouselListPage', ['carousels' => $carousels]);
    }

    //carousel save page
    public function carouselSavePage(Request $request)
    {
        $carousel = Carousel::find($request->carousel_id);
        return Inertia::render('BackEnd/Carousel/CarouselSavePage', ['carousel' => $carousel]);
    }

    //carousel save
    public function carouselSave(CarouselSaveRequest $request)
    {
        $data = [
            'rank' => $request->rank,
            'title' => $request->title,
            'description' => $request->description
        ];

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('carousel', $imageName);
            $data['image'] = $imageName;
        }
        Carousel::create($data);
        return redirect()->back()->with(['status' => true, 'message' => 'Carousel Saved Successfully']);
    }

    //carousel update
    public function carouselUpdate(CarouselSaveRequest $request, $carousel_id)
    {


        $data = [
            'rank' => $request->rank,
            'title' => $request->title,
            'description' => $request->description
        ];


        $carousel = Carousel::findOrFail($carousel_id);

        if ($request->hasFile('image')) {

            if ($carousel->image && Storage::exists('carousel/' . $carousel->image)) {
                Storage::delete('carousel/' . $carousel->image);
            }

            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('carousel', $imageName);
            $data['image'] = $imageName;
        }

        $carousel->update($data);

        return redirect()->back()->with(['status' => true, 'message' => 'Carousel Updated Successfully']);
    }

    //delete country
    public function carouselDelete($country_id)
    {
        $carousel = Carousel::findOrFail($country_id);
        if ($carousel->image && Storage::exists('carousel/' . $carousel->image)) {
            Storage::delete('carousel/' . $carousel->image);
        }
        $carousel->delete();
        return redirect()->back()->with(['status' => true, 'message' => 'Carousel Deleted Successfully']);
    }

}
