<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

/**
 * Validasi saat update/edit produk
 * hampir sama kayak store, tapi SKU bisa tetap sama (untuk produk yg sedang di-edit)
 */
class UpdateProductRequest extends FormRequest
{
    /**
     * Cek user auth
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Rule validasi untuk update
     */
    public function rules(): array
    {
        // ambil ID produk yang sedang diedit dari URL
        $productId = $this->route('product')->id;

        return [
            'name' => ['required', 'string', 'max:255'],
            // SKU unique tapi ignore produk yg sedang diedit
            // jadi kalau update tapi SKU tetap sama, gak error "duplicate SKU"
            'sku' => ['required', 'string', 'max:100', Rule::unique('products', 'sku')->ignore($productId)],
            'category' => ['required', 'string', 'max:100'],
            'stock' => ['required', 'integer', 'min:0'],
            'price' => ['required', 'numeric', 'min:0'],
            'description' => ['nullable', 'string'],
            'is_active' => ['nullable', 'boolean'],
        ];
    }

    /**
     * Pre-process: convert checkbox 'is_active' jadi boolean
     */
    protected function prepareForValidation(): void
    {
        $this->merge([
            'is_active' => $this->boolean('is_active'),
        ]);
    }
}
