<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PageSaveRequest extends FormRequest
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
            'name' => 'required|string|max:255|unique:page_names,name,' . $this->route('id'),
            'rank' => 'required|integer|min:1|unique:page_names,rank,' . $this->route('id'),
        ];
    }
}
