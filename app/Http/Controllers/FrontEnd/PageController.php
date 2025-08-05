<?php

namespace App\Http\Controllers\FrontEnd;

use App\Models\Page;
use App\Models\User;
use Inertia\Inertia;
use App\Models\Booking;
use App\Models\Country;
use App\Models\PageName;
use App\Models\University;
use Illuminate\Http\Request;
use App\Models\ServiceCategory;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PageController extends Controller
{

    //Dashboard page
    public function dashboard(){
        return Inertia::render('BackEnd/DashBoardPage');
    }

    //profile
    public function profile(){
        $userId=Auth::user()->id;
        $profile=User::find($userId);
        return Inertia::render('ProfilePage',['profile'=>$profile]);
    }

    public function page(Request $request, $pageName){

        $pageView=PageName::where('slug',$pageName)->with('pages')->first();
        return Inertia::render('FrontEnd/PageViewPage',['pageView'=>$pageView]);
    }

    //student dashboard page
    public function studentDashboard(){
        $userId=Auth::check()?Auth::user()->id:0;
        $bookings=Booking::where('user_id',$userId)->get();
        return Inertia::render('FrontEnd/StudentDashBoardPage',['bookings'=>$bookings]);
    }

    //login page
    public function login(){
        return Inertia::render('FrontEnd/Auth/LoginPage');
    }

    //register page
    public function register(){
        return Inertia::render('FrontEnd/Auth/RegistrationPage');
    }

    //home page
    public function home(){
        $countries=Country::all();
        $serviceCategories=ServiceCategory::all();
        $universities=University::with('country')->get();
        return Inertia::render('FrontEnd/HomePage',['countries'=>$countries,'serviceCategories'=>$serviceCategories,'universities'=>$universities]);
    }

    //about
    public function about(){
        return Inertia::render('FrontEnd/AboutPage');
    }

    public function pageView($page){
        $pageView=PageName::where('name',$page)->with('pages')->first();
        return Inertia::render('FrontEnd/PageViewPage',['pageView'=>$pageView]);

    }


    //contact page
    public function contact(){
        return Inertia::render('FrontEnd/ContactPage');
    }
    //booking
    public function travelBooking(Request $request){
        $university=University::find($request->university_id);
        return Inertia::render('FrontEnd/BookingPage',['university'=>$university]);
    }

    //destination
    public function destination(){
        $destination=Page::where('page_name','Destination')->first();
        return Inertia::render('FrontEnd/DestinationPage' ,['destination'=>$destination]);
    }

    //gallery
    public function ourGallery(){
        $gallery=Page::where('page_name','Our Gallery')->first();
        return Inertia::render('FrontEnd/GalleryPage' ,['gallery'=>$gallery]);
    }

    //services
    public function services(){
        $serviceCategories=ServiceCategory::all();
        return Inertia::render('FrontEnd/ServicesPage',['serviceCategories'=>$serviceCategories]);
    }

    //guides
    public function guides(){
        return Inertia::render('FrontEnd/GuidesPage');
    }

    // packages
    public function packages(){

        return Inertia::render('FrontEnd/PackagesPage');
    }

    //testimonial
    public function testimonial(){
        // $testimonial=Page::where('page_name','Testimonial')->first();
        return Inertia::render('FrontEnd/TestimonialPage',);
    }
}
