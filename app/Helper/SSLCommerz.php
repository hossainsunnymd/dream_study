<?php

namespace App\Helper;

use Exception;
use App\Models\SslcommerzAccount;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class SSLCommerz
{


static function initiatePayment($booking_id, $payment_description)
{
    $tran_id = uniqid();
    $ssl = DB::table('sscommerz_accounts')->first();

    try {
        $response = Http::asForm()->post('https://sandbox.sslcommerz.com/gwprocess/v4/api.php', [
            "store_id" => $ssl->store_id,
            "store_passwd" => $ssl->store_password,
            "total_amount" => 500,
            "currency" => $ssl->currency,
            "tran_id" => $tran_id,
            "success_url" => "{$ssl->success_url}?booking_id={$booking_id}&payment_description={$payment_description}",
            "fail_url" => "{$ssl->fail_url}?booking_id={$booking_id}&payment_description={$payment_description}",
            "cancel_url" => "{$ssl->cancel_url}?booking_id={$booking_id}&payment_description={$payment_description}",
            "cus_name" => 'dreamland',
            "cus_email" => 'dreamland@gmail.com',
            "cus_add1" => 'Dhaka',
            "cus_add2" => 'Dhaka',
            "cus_city" => 'Dhaka',
            "cus_state" => 'Dhaka',
            "cus_postcode" => "1200",
            "cus_country" => "Bangladesh",
            "cus_phone" => '0123456789',
            "cus_fax" => "0123456789",
            "shipping_method" => "YES",
            "ship_name" => 'dreamland',
            "ship_add1" => 'Dhaka',
            "ship_add2" => 'Dhaka',
            "ship_city" => 'Dhaka',
            "ship_state" => 'Dhaka',
            "ship_country" => 'Bangladesh',
            "ship_postcode" => "12000",
            'product_name' => 'Product Name',
            'product_category' => 'Product Category',
            'product_profile' => 'Product Profile',
        ]);

        return $response->json();

    } catch (Exception $e) {
        return response()->json(['error' => $e->getMessage()]);
    }
}

}
