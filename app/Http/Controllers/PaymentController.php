<?php

namespace App\Http\Controllers;

use Exception;
use Inertia\Inertia;
use App\Models\Booking;
use App\Helper\SSLCommerz;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;


class PaymentController extends Controller
{
    //payment init
   public function paymentInit(Request $request)
{
    $booking_id = $request->booking_id;
    $payment_description = $request->payment_description;

    return SSLCommerz::initiatePayment($booking_id, $payment_description);
}


    //payment success
    public function paymentSuccess(Request $request)
    {

        Booking::where('id', $request->booking_id)->update([
            'payment_description' => $request->payment_description,
            'payment_status' => 'success'
        ]);
        return redirect('/payment/success');

    }

    //payment cancel
    public function paymentCancel(Request $request)
    {
        Booking::where('id', $request->booking_id)->update([
            'payment_status' => 'cancel',
            'payment_description' => $request->payment_description
        ]);
        return redirect('/payment/cancel');
    }

    //payment fail
    public function paymentFail(Request $request)
    {
        Booking::where('id', $request->booking_id)->update([
            'payment_status' => 'fail',
            'payment_description' => $request->payment_description
        ]);
        return redirect('/payment/fail');

    }
}
