<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

/**
 * Seeder untuk 150 produk toko
 * pakai catalog.php buat data realistis (nama, kategori, harga real)
 */
class ProductSeeder extends Seeder
{
    public function run(): void
    {
        // load catalog 150 produk (sudah ada nama, kategori, harga real)
        $products = require __DIR__ . '/product_catalog.php';

        // hapus produk lama (kalau rerun seeder, jangan duplicate)
        Product::query()->delete();

        // mapping catalog jadi array yang ready buat di-insert ke DB
        // generate SKU unik (PRD-0001, PRD-0002, dll)
        $sequence = array_map(function (array $product, int $index): array {
            return [
                'name' => $product['name'],
                'sku' => 'PRD-' . str_pad((string) ($index + 1), 4, '0', STR_PAD_LEFT), // PRD-0001, PRD-0002
                'category' => $product['category'],
                'stock' => (($index + 3) * 7) % 121,  // stok random tapi punya pola, biar realistis
                'price' => $product['price'],
                'description' => $product['description'],
                'is_active' => ($index + 1) % 13 !== 0, // 12/13 produk aktif, 1/13 nonaktif
            ];
        }, $products, array_keys($products));

        // create 150 produk sekaligus pake factory + sequence
        // jadi datanya konsisten sesuai mapping di atas
        Product::factory()
            ->count(count($products))
            ->sequence(...$sequence)
            ->create();
    }
}
