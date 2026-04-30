<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

/**
 * Seeder utama database
 * dijalankan saat: php artisan migrate:fresh --seed
 */
class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // buat user admin atau update jika sudah ada (jangan duplicate)
        // updateOrCreate = smart, gak bikin user baru kalau email sudah ada
        User::updateOrCreate(
            ['email' => 'admin@cokomi.test'], // cek berdasarkan email ini
            [
                'name' => 'Pak Cokomi',
                'password' => Hash::make('password'), // password di-hash buat keamanan
            ]
        );

        // buat user pembeli / customer
        User::updateOrCreate(
            ['email' => 'wowo@toko.test'],
            [
                'name' => 'Mas Wowo',
                'password' => Hash::make('password'),
            ]
        );

        // panggil ProductSeeder buat isi 150 produk awal
        $this->call(ProductSeeder::class);
    }
}
