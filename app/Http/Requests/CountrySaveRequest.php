<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CountrySaveRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'country_name' => 'required|string|max:255',
            'rank'=>'required|integer|min:1|unique:countries,rank,' . $this->route('id'),
            'country_image' => $this->hasFile('image') ? 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048' : 'required|string',
        ];
    }
}
