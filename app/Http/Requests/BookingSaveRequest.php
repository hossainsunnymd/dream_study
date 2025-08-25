<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class BookingSaveRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user=Auth::user();
        if($user->is_active=='Enable'){
               return true;
        }
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'bd_phone' => 'required|string',
            'last_education' => 'required|string',
            'prefferred_country' => 'required|string',
            'pdf' => $this->hasFile('pdf') ?'file|max:2048' : '',
            'payment_descriptioin' => 'nullable|string',

        ];
    }
}
