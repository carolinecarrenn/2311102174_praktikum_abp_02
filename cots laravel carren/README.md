# Inventari Toko Pak Cokomi & Mas Wowo

Aplikasi web inventari toko berbasis Laravel Breeze. Admin bisa login untuk mengelola produk, sementara Pak Cokomi bisa membuka etalase Toko Mas Wowo, memasukkan produk ke keranjang, dan checkout.

## Checklist Fitur Wajib

- Sistem login, register, dan logout memakai Laravel Breeze.
- Dashboard admin setelah login.
- CRUD produk lengkap: tambah, lihat daftar, edit, dan hapus.
- Tampilan daftar produk seperti data table dengan pencarian ringan.
- Form create produk.
- Form edit produk.
- Modal konfirmasi sebelum delete produk.
- Data produk tersimpan di database.
- Database factory untuk data produk toko yang realistis.
- Seeder untuk akun demo dan 150 produk awal dengan nama serta keterangan produk yang realistis.
- Dokumentasi project dan catatan instalasi.
- Halaman belanja sederhana untuk alur Pak Cokomi belanja di toko Mas Wowo.

## Stack

- PHP 8.4+ untuk vendor yang sudah terpasang di project ini.
- Laravel 13.
- Laravel Breeze Blade.
- MySQL atau MariaDB.
- Vite.
- Blade dan CSS custom.

## Akun Demo

Seeder membuat dua akun:

| Role | Email | Password |
| --- | --- | --- |
| Admin Cokomi | `admin@cokomi.test` | `password` |
| Mas Wowo | `wowo@toko.test` | `password` |

## Struktur Penting

- `routes/web.php`: route dashboard, CRUD produk, shop, cart, dan checkout.
- `routes/auth.php`: route authentication bawaan Breeze.
- `app/Http/Controllers/ProductController.php`: controller CRUD produk.
- `app/Http/Controllers/ShopController.php`: controller etalase, keranjang, dan checkout.
- `app/Models/Product.php`: model produk.
- `app/Models/Cart.php`: model keranjang.
- `app/Http/Requests/StoreProductRequest.php`: validasi create produk.
- `app/Http/Requests/UpdateProductRequest.php`: validasi update produk.
- `database/migrations/*create_products_table.php`: tabel produk.
- `database/migrations/*create_carts_table.php`: tabel keranjang.
- `database/factories/ProductFactory.php`: factory data produk.
- `database/seeders/DatabaseSeeder.php`: seeder akun demo.
- `database/seeders/ProductSeeder.php`: seeder 150 produk awal.
- `database/seeders/product_catalog.php`: katalog nama, kategori, harga, dan keterangan produk realistis.
- `resources/views/products/*`: table, form create, form edit, dan modal delete.
- `resources/views/shop/*`: halaman belanja dan keranjang.
- `resources/css/app.css`: styling utama aplikasi.

## Cara Menjalankan

1. Install dependency PHP:

```bash
composer install
```

2. Install dependency frontend:

```bash
npm install
```

3. Siapkan file environment:

```bash
copy .env.example .env
php artisan key:generate
```

4. Atur database di `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=inventari_toko
DB_USERNAME=root
DB_PASSWORD=
```

5. Jalankan migration dan seeder:

```bash
php artisan migrate:fresh --seed
```

6. Build asset:

```bash
npm run build
```

7. Jalankan server:

```bash
php artisan serve
```

Lalu buka:

- `http://127.0.0.1:8000` untuk etalase belanja.
- `http://127.0.0.1:8000/login` untuk login.
- `http://127.0.0.1:8000/dashboard` untuk dashboard admin setelah login.

## Alur Utama

1. Login memakai akun demo.
2. Buka dashboard untuk melihat ringkasan produk dan stok.
3. Buka menu Produk untuk mengelola data produk.
4. Tambah produk lewat tombol Tambah Produk.
5. Edit produk lewat tombol Edit di table.
6. Hapus produk lewat tombol Hapus, lalu konfirmasi di modal.
7. Buka menu Belanja untuk membeli produk sebagai pembeli.
8. Tambahkan produk ke keranjang dan checkout untuk mengurangi stok.

## Testing

Project sudah punya feature test dasar untuk CRUD produk:

```bash
php artisan test
```

Catatan: gunakan PHP 8.4+ agar versi dependency Laravel dan PHPUnit di project ini bisa berjalan.
