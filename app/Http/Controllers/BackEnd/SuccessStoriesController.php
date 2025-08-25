<?php

namespace App\Http\Controllers\BackEnd;

use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Models\SuccessStories;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\SuccessStorySaveRequest;

class SuccessStoriesController extends Controller
{
    //success stories list
    public function successStoriesList()
    {
        $successStories = SuccessStories::all();
        return Inertia::render('BackEnd/SuccessStories/SuccessStoriesListPage', ['successStories' => $successStories]);

    }

    //success stories save page
    public function successStoriesSavePage(Request $request)
    {
        $successStory = SuccessStories::find($request->success_id);
        return Inertia::render('BackEnd/SuccessStories/SuccessStoriesSavePage', ['successStory' => $successStory]);
    }

    //success story save
    public function successStoriesSave(SuccessStorySaveRequest $request)
    {

        $data = [
            'video' => $request->video,
            'rank' => $request->rank
        ];
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('success', $imageName);
            $data['image'] = $imageName;
        }
        SuccessStories::create($data);
        return redirect()->back()->with(['status' => true, 'message' => 'Success Story Saved Successfully']);
    }

    //update success story
    public function successStoriesUpdate(SuccessStorySaveRequest $request, $success_id)
    {
        $story = SuccessStories::findOrFail($success_id);

        $data = [
            'video' => $request->video,
            'rank' => $request->rank
        ];

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($story->image && Storage::exists('success/' . $story->image)) {
                Storage::delete('success/' . $story->image);
            }

            // Store new image
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalName();
            $image->storeAs('success', $imageName);
            $data['image'] = $imageName;
        }

        $story->update($data);

        return redirect()->back()->with(['status' => true, 'message' => 'Success Story Updated Successfully']);
    }

    //delete Success story
    public function successStoriesDelete($success_id)
    {
        $story = SuccessStories::findOrFail($success_id);
        if ($story->image && Storage::exists('success/' . $story->image)) {
            Storage::delete('success/' . $story->image);
        }
        $story->delete();
        return redirect()->back()->with(['status' => true, 'message' => 'Success Story Deleted Successfully']);
    }
}
