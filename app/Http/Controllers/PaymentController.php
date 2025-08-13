<?php

namespace App\Http\Controllers;

use Exception;
use App\Helper\SSLCommerz;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class PaymentController extends Controller
{
    //payment init
    public function paymentInit()
    {
        return SSLCommerz::initiatePayment();
    }


    //payment success
    public function paymentSuccess(Request $request)
    {

        return redirect('/payment/success');

    }

    //payment cancel
    public function paymentCancel()
    {

        return redirect('/payment/cancel');
    }

    //payment fail
    public function paymentFail()
    {
        return redirect('/payment/fail');

    }
}
