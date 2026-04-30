<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Product;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

class ProductController extends Controller
{
    /**
     * Tampilkan daftar produk di table dengan summary stok
     */
    public function index(): View
    {
        // ambil produk terbaru, 10 per halaman biar ga kegedean
        $products = Product::latest()->paginate(10);

        // hitung ringkasan: total produk, berapa yang aktif, stok menipis
        // ini buat ditampilin di summary card di atas table
        return view('products.index', [
            'products' => $products,
            'summary' => [
                'total' => Product::count(),
                'active' => Product::where('is_active', true)->count(),
                'inactive' => Product::where('is_active', false)->count(),
                'low_stock' => Product::where('stock', '<=', 5)->count(),
            ],
        ]);
    }

    /**
     * Tampilkan form buat tambah produk baru
     */
    public function create(): View
    {
        // cukup return view, form fieldnya udah di template
        return view('products.create');
    }

    /**
     * Simpan produk baru ke database
     * StoreProductRequest uda handle validasi (nama wajib, harga harus number, dll)
     */
    public function store(StoreProductRequest $request): RedirectResponse
    {
        // $request->validated() uda dipastiin valid, langsung buat di DB
        Product::create($request->validated());

        // redirect balik ke list produk, tampilin success message
        return redirect()
            ->route('products.index')
            ->with('success', 'Produk berhasil ditambahkan.');
    }

    /**
     * Tampilkan form edit produk yg dipilih
     * Product $product dari route model binding (otomatis fetch by id)
     */
    public function edit(Product $product): View
    {
        // compact() itu shortcut buat pass variabel ke view
        // jadi view bisa akses $product langsung
        return view('products.edit', compact('product'));
    }

    /**
     * Update data produk di database
     */
    public function update(UpdateProductRequest $request, Product $product): RedirectResponse
    {
        // update($request->validated()) masukin data yg sudah tervalidasi
        $product->update($request->validated());

        // kembali ke list, kasih notif berhasil
        return redirect()
            ->route('products.index')
            ->with('success', 'Produk berhasil diperbarui.');
    }

    /**
     * Hapus produk dari database
     */
    public function destroy(Product $product): RedirectResponse
    {
        // delete() dari model Eloquent, langsung ke DB
        $product->delete();

        // kembali ke list produk dengan pesan sukses
        return redirect()
            ->route('products.index')
            ->with('success', 'Produk berhasil dihapus.');
    }
}

