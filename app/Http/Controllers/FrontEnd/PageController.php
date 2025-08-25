<?php

namespace App\Http\Controllers\FrontEnd;

use App\Models\Page;
use App\Models\User;
use Inertia\Inertia;
use App\Models\Booking;
use App\Models\Country;
use App\Models\Carousel;
use App\Models\PageName;
use App\Models\Services;
use App\Models\University;
use Illuminate\Http\Request;
use App\Models\StudentReview;
use App\Models\SuccessStories;
use App\Models\ServiceCategory;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PageController extends Controller
{

    //Dashboard page
    public function dashboard()
    {
        $users=User::where('user_type','admin')->count();
        $students=User::where('user_type','student')->count();
        $services=Services::count();
        return Inertia::render('BackEnd/DashBoardPage',['users'=>$users,'students'=>$students,'services'=>$services]);
    }

    //profile
    public function profile()
    {
        $userId = Auth::user()->id;
        $profile = User::find($userId);
        return Inertia::render('ProfilePage', ['profile' => $profile]);
    }

    public function page(Request $request, $pageName)
    {

        $pageView = PageName::where('slug', $pageName)->with('pages')->first();
        return Inertia::render('FrontEnd/PageViewPage', ['pageView' => $pageView]);
    }

    //student dashboard page
    public function studentDashboard()
    {
        $userId = Auth::check() ? Auth::user()->id : 0;
        $bookings = Booking::where('user_id', $userId)->get();
        return Inertia::render('FrontEnd/StudentDashBoardPage', ['bookings' => $bookings]);
    }

    //login page
    public function login()
    {
        return Inertia::render('FrontEnd/Auth/LoginPage');
    }

    //register page
    public function register()
    {
        return Inertia::render('FrontEnd/Auth/RegistrationPage');
    }

    //home page
    public function home()
    {

        $universities = University::with('country')->orderBy('rank', 'asc')->get();
        $reviews = StudentReview::orderBy('rank', 'asc')->get();
        $carousels = Carousel::orderBy('rank', 'asc')->get();
        return Inertia::render(
            'FrontEnd/HomePage',
            [
                'universities' => $universities,
                'reviews' => $reviews,
                'carousels' => $carousels
            ]
        );
    }

    //about
    public function about()
    {
        return Inertia::render('FrontEnd/AboutPage');
    }

    public function pageView($page)
    {
        $pageView = PageName::where('name', $page)->with('pages')->first();
        return Inertia::render('FrontEnd/PageViewPage', ['pageView' => $pageView]);

    }


    //contact page
    public function contact()
    {
        return Inertia::render('FrontEnd/ContactPage');
    }
    //booking
    public function travelBooking(Request $request)
    {
        $university = University::find($request->university_id);
        return Inertia::render('FrontEnd/BookingPage', ['university' => $university]);
    }


    //services
    public function services()
    {
        $serviceCategories = ServiceCategory::all();
        return Inertia::render('FrontEnd/ServicesPage', ['serviceCategories' => $serviceCategories]);
    }




}
