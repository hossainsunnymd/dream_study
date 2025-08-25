<?php
use App\Http\Controllers\PaymentController;
use Illuminate\Support\Facades\Route;





Route::post('/payment-success', [PaymentController::class, 'paymentSuccess']);
Route::post('/payment-cancel', [PaymentController::class, 'paymentCancel']);
Route::post('/payment-fail', [PaymentController::class, 'paymentFail']);
