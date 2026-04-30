<?php

use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

/**
 * Route halaman depan
 * jika belum login, redirect ke dashboard
 */
Route::get('/', function () {
    return redirect()->route('dashboard');
});

/**
 * Route yang perlu login (protected dengan middleware auth)
 */
Route::middleware(['auth'])->group(function () {
    // dashboard halaman utama
    Route::view('/dashboard', 'dashboard')->name('dashboard');
    
    // CRUD produk - except('show') karena ga ada halaman detail produk
    // ini auto-generate 5 route: index, create, store, edit, update, destroy
    Route::resource('products', ProductController::class)->except('show');
});

// load route authentication bawaan Breeze (login, register, password reset, etc)
require __DIR__.'/auth.php';
