<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Logo extends Model
{
   protected $fillable = [
    'site_name',
    'site_favicon',
    'site_logo',
    'fb_logo',
    'fb_link',
    'twitter_logo',
    'twitter_link',
    'instagram_logo',
    'instagram_link',
    'linkedin_logo',
    'linkedin_link',
    'youtube_logo',
    'youtube_link',
    'about_banner_image',
    'about_hero_image',
    'about_content',
    'booking_content',
    'login_banner_image',
    'register_banner_image',
    'site_address',
    'site_email',
    'site_phone',
    'site_fax',
    'service_banner_image',
    'contact_banner_image',
    'booking_banner_image',
    'verify_email_banner_image',
    'verify_otp_banner_image',
    'reset_password_banner_image',
];

}
