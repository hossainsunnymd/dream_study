<?php

namespace App\Http\Controllers\Auth;

use Exception;
use App\Models\User;
use Inertia\Inertia;
use App\Mail\OTPMail;
use App\Helper\JWTToken;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules\Email;
use App\Http\Requests\EmailVerifyRequest;
use Illuminate\Support\Facades\Hash;

class ResetPasswordController extends Controller
{
    //verify email page
    public function verifyEmailPage()
    {
        return Inertia::render('FrontEnd/Auth/VerifyEmailPage');
    }

    //verify email
    public function verifyEmail(EmailVerifyRequest $request)
    {

        try {
            $count = User::where('email', '=', $request->input('email'))->count();
            if ($count == 1) {
                $rand = rand(100000, 999999);
                User::where('email', '=', $request->input('email'))->update(['otp' => $rand]);
                $otpMail = new OTPMail($rand);
                Mail::to($request->input('email'))->send($otpMail);
                $request->session()->put('email', $request->input('email'));
                return redirect()->back()->with([
                    'status' => true,
                    'message' => "Otp Sent Successfully"
                ]);
            }else{
                return redirect()->back()->with([
                    'status' => false,
                    'message' => "Email Not Found"
                ]);
            }
        } catch (Exception $e) {
            return redirect()->back()->with([
                'status' => false,
                'message' => $e->getMessage()
            ], 401);
        }
    }

    //verify otp page
    public function verifyOtpPage()
    {
        return Inertia::render('FrontEnd/Auth/VerifyOtpPage');
    }

    //verify otp
    public function verifyOtp(Request $request)
    {
        try {
            $email = $request->session()->get('email');

            $count = User::where('email', $email)
                ->where('otp', $request->input('otp'))
                ->count();

            if ($count == 1) {
                User::where('email', $email)->update(['otp' => '0']);
                $token = JWTToken::createToken($email);

                return redirect()->back()
                    ->with(['status' => true, 'message' => "Otp Verified Successfully"])
                    ->cookie('token', $token, 60 * 5);
            }

            return redirect()->back()->with([
                'status' => false,
                'message' => 'Invalid OTP',
            ]);

        } catch (Exception $e) {
            return redirect()->back()->with([
                'status' => false,
                'message' => 'Unauthorized'
            ]);
        }
    }

    //reset password page
    public function resetPasswordPage()
    {
        return Inertia::render('FrontEnd/Auth/ResetPasswordPage');
    }

    //reset password
    public function resetPassword(Request $request)
    {
        try {
            $email = $request->session()->get('email');
            $password = $request->input('password');
            User::where('email', '=', $email)->update(['password' => Hash::make($password)]);
            $request->session()->forget('email');
            return redirect()->back()->with([
                'status' => true,
                'message' => "Password Reset Successfully"
            ], 200);
        } catch (Exception $e) {
            return redirect()->back()->with([
                'status' => false,
                'message' => "unauthorized"
            ]);
        }
    }

}
