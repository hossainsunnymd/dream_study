<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Logo;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\LogoSaveRequest;
use Illuminate\Support\Facades\Storage;

class LogoController extends Controller
{
    //logo list
    public function logoList()
    {
        $logos = Logo::all();
        return Inertia::render('BackEnd/Logo/LogolistPage', ['logos' => $logos]);
    }

    //logo save page
    public function logoSavePage(Request $request)
    {
        $logo = Logo::find($request->logo_id);
        return Inertia::render('BackEnd/Logo/LogoSavePage', ['logo' => $logo]);
    }

    //logo save
    public function logoSave(Request $request)
    {

        $data = $request->only([
            'fb_link',
            'twitter_link',
            'instagram_link',
            'linkedin_link',
            'youtube_link',
            'about_content',
            'booking_content',
            'site_address',
            'site_email',
            'site_phone',
            'site_fax',
            'google_map_link',
            'whatsapp_number',
        ]);

        $fileFields = [
            'site_favicon',
            'site_logo',
            'about_banner_image',
            'about_hero_image',
            'login_banner_image',
            'register_banner_image',
            'service_banner_image',
            'contact_banner_image',
            'booking_banner_image',
            'verify_email_banner_image',
            'verify_otp_banner_image',
            'reset_password_banner_image',
            'payment_image',
        ];

        foreach ($fileFields as $field) {
            if ($request->hasFile($field)) {
                $image = $request->file($field);
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->storeAs('logo', $imageName);
                $data[$field] = $imageName;
            }
        }

        Logo::create($data);

        return redirect()->back()->with([
            'status' => true,
            'message' => 'Site Settings Saved Successfully'
        ]);
    }

    //update logo
    public function logoUpdate( Request $request, $logo_id)
    {

        $siteSetting = Logo::findOrFail($logo_id);

        $data = $request->only([
            'fb_link',
            'twitter_link',
            'instagram_link',
            'linkedin_link',
            'youtube_link',
            'about_content',
            'booking_content',
            'site_address',
            'site_email',
            'site_phone',
            'site_fax',
            'google_map_link',
            'whatsapp_number',
        ]);

        $fileFields = [
            'site_favicon',
            'site_logo',
            'about_banner_image',
            'about_hero_image',
            'login_banner_image',
            'register_banner_image',
            'service_banner_image',
            'contact_banner_image',
            'booking_banner_image',
            'verify_email_banner_image',
            'verify_otp_banner_image',
            'reset_password_banner_image',
            'payment_image',

        ];

        foreach ($fileFields as $field) {
            if ($request->hasFile($field)) {
                $image = $request->file($field);
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->storeAs('logo', $imageName);

                if ($siteSetting->$field && Storage::exists('logo/' . $siteSetting->$field)) {
                    Storage::delete('logo/' . $siteSetting->$field);
                }

                $data[$field] = $imageName;
            }
        }

        $siteSetting->update($data);

        return redirect()->back()->with([
            'status' => true,
            'message' => 'Site Settings Updated Successfully'
        ]);
    }

    //delete logo
    public function logoDelete($id)
    {
        $siteSetting = Logo::findOrFail($id);

        $fileFields = [
            'site_favicon',
            'site_logo',
            'about_banner_image',
            'about_hero_image',
            'login_banner_image',
            'register_banner_image',
            'service_banner_image',
            'contact_banner_image',
            'booking_banner_image',
            'verify_email_banner_image',
            'verify_otp_banner_image',
            'reset_password_banner_image',
            'payment_image',
        ];

        foreach ($fileFields as $field) {
            if ($siteSetting->$field && Storage::exists('logo/' . $siteSetting->$field)) {
                Storage::delete('logo/' . $siteSetting->$field);
            }
        }

        $siteSetting->delete();

        return redirect()->back()->with([
            'status' => true,
            'message' => 'Site Setting Deleted Successfully',
        ]);
    }


}
