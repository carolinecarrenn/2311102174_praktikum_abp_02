<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

/**
 * Validasi saat create produk baru
 * jika invalid, laravel otomatis redirect balik ke form dengan error
 */
class StoreProductRequest extends FormRequest
{
    /**
     * Cek apakah user boleh buat request ini
     * hanya user yang sudah login aja yang boleh
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Rule validasi untuk setiap field
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],                 // nama wajib, text, max 255 karakter
            'sku' => ['required', 'string', 'max:100', 'unique:products,sku'], // SKU wajib, unik (gak boleh duplicate)
            'category' => ['required', 'string', 'max:100'],             // kategori wajib, text
            'stock' => ['required', 'integer', 'min:0'],               // stok wajib, harus angka, min 0
            'price' => ['required', 'numeric', 'min:0'],               // harga wajib, angka, min 0
            'description' => ['nullable', 'string'],                    // keterangan opsional, bisa kosong
            'is_active' => ['nullable', 'boolean'],                     // status opsional, true/false
        ];
    }

    /**
     * Pre-processing sebelum validasi
     * convert checkbox 'is_active' jadi boolean (true/false)
     * kalau gak ada checkbox di form, jadi false
     */
    protected function prepareForValidation(): void
    {
        $this->merge([
            'is_active' => $this->boolean('is_active'),
        ]);
    }
}
