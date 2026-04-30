<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * Factory buat generate data produk awal
 * dipakai seeder dan test supaya format produknya konsisten
 */
class ProductFactory extends Factory
{
    // model mana yang diproduce oleh factory ini
    protected $model = Product::class;

    /**
     * Blueprint data produk
     * setiap kali factory()->create(), data ini yang dipake
     */
    public function definition(): array
    {
        // ambil catalog produk nyata (nama, harga, kategori real)
        // jadi datanya realistis, bukan asal random
        $catalog = require database_path('seeders/product_catalog.php');
        $product = fake()->randomElement($catalog);

        return [
            'name' => $product['name'],                    // nama dari catalog
            'sku' => 'FAC-' . fake()->unique()->numberBetween(1000, 9999), // kode unik otomatis
            'category' => $product['category'],            // kategori dari catalog
            'stock' => fake()->numberBetween(0, 120),     // stok random 0-120 unit
            'price' => $product['price'],                  // harga dari catalog
            'description' => $product['description'],      // deskripsi dari catalog
            'is_active' => fake()->boolean(85),           // 85% produk aktif, 15% nonaktif
        ];
    }
}
