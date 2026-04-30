<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    // kasih akses ke factory buat generate data awal produk
    use HasFactory;

    // field mana aja yang boleh di-assign langsung (mass assignment)
    // ini safety feature biar user gak bisa inject field yang gak diinginkan
    protected $fillable = [
        'name',       // nama produk
        'sku',        // kode unik produk (stock keeping unit)
        'category',   // kategori produk (minuman, snack, dll)
        'stock',      // jumlah stok di gudang
        'price',      // harga produk
        'description', // deskripsi / keterangan produk
        'is_active',  // status produk aktif/nonaktif
    ];

    // casting = otomatis convert tipe data pas diambil dari DB
    protected $casts = [
        'is_active' => 'boolean', // convert 0/1 jadi true/false
        'price' => 'decimal:2',   // harga jadi decimal dengan 2 desimal (Rp)
    ];

    /**
     * Accessor: format harga jadi Rp X.XXX otomatis
     * dipakai di template: {{ $product->formatted_price }}
     */
    public function getFormattedPriceAttribute(): string
    {
        // number_format = format angka dengan pemisah ribuan (Rp 10.000)
        // 0 berarti tanpa desimal, ',' pemisah desimal, '.' pemisah ribuan
        return 'Rp ' . number_format((float) $this->price, 0, ',', '.');
    }
}
