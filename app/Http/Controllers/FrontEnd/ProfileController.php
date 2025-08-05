<?php

namespace App\Http\Controllers\FrontEnd;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\UserSaveRequest;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    public function updateProfile(UserSaveRequest $request, $id)
    {
        $user = User::findOrFail($id);

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . '.' . $file->getClientOriginalExtension();

            // Delete old image from storage
            if ($user->profile_image && Storage::disk('public')->exists('profile/' . $user->profile_image)) {
                Storage::disk('public')->delete('profile/' . $user->profile_image);
            }

            // Store new image
            $file->storeAs('profile', $filename, 'public');

            // Save filename in database
            $user->profile_image = $filename;
        }

        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->abroad_mobile = $request->abroad_phone;
        $user->save();

        return redirect()->back()->with(['status' => true, 'message' => 'Profile updated successfully']);
    }
}
