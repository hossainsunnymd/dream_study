<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\User;
use Inertia\Inertia;
use App\Models\Booking;
use App\Models\Country;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\BookingSaveRequest;

class BookingController extends Controller
{
    //bookig list
  public function bookingList(Request $request)
{
    $fd = $request->fromDate ? date('Y-m-d', strtotime($request->fromDate)) : null;
    $td = $request->toDate ? date('Y-m-d', strtotime($request->toDate)) : null;

    $countries = Country::all();

    $bookings = Booking::when($fd && $td, function ($q) use ($fd, $td) {
            $q->whereDate('created_at', '>=', $fd)
              ->whereDate('created_at', '<=', $td);
        })
        ->when($request->status, function ($q) use ($request) {
            $q->where('status', $request->status);
        })
        ->when($request->country_name, function ($q) use ($request) {
            $q->where('prefferred_country', $request->country_name);
        })
        ->get();

    return Inertia::render('BackEnd/Booking/BookingListPage', [
        'bookings' => $bookings,
        'countries' => $countries
    ]);
}

    //booking save page
    public function bookingSavePage(Request $request)
    {
        $booking = Booking::find($request->booking_id);
        $users = User::all();
        return Inertia::render('BackEnd/Booking/BookingSavePage', ['booking' => $booking, 'users' => $users]);
    }

    //create booking
    public function bookingSave(BookingSaveRequest $request)
    {

        // return $request->all();
        $data = [
            'user_id' => $request->user_id,
            'name' => $request->name,
            'email' => $request->email,
            'bd_mobile' => $request->bd_phone,
            'last_education' => $request->last_education,
            'prefferred_country' => $request->prefferred_country,
        ];

        if ($request->hasFile('pdf')) {
            $file = $request->file('pdf');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('booking', $fileName);
            $data['pdf'] = $fileName;
        }

        Booking::create($data);
        return redirect()->back()->with(['status' => true, 'message' => 'Booking Saved Successfully']);
    }

    //update booking
    public function bookingUpdate(BookingSaveRequest $request)
    {
        Booking::where('id', $request->booking_id)->update([
            'user_id' => $request->user_id,
            'name' => $request->name,
            'email' => $request->email,
            'bd_mobile' => $request->bd_phone,
            'last_education' => $request->last_education,
            'prefferred_country' => $request->prefferred_country,
            'status' => $request->status,
            'payment_status' => $request->payment_status,
            'payment_description' => $request->payment_description
        ]);

        return redirect()->back()->with(['status' => true, 'message' => 'Booking Updated Successfully']);
    }

    //delete booking
    public function bookingDelete(Request $request)
    {
        Booking::where('id', $request->id)->delete();
        return redirect()->back()->with(['status' => true, 'message' => 'Booking Deleted Successfully']);
    }
}
