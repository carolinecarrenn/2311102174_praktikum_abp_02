<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Belanja Produk - Toko Mas Wowo</title>
        <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
    </head>
    <body class="shop-body">
        <header class="shop-topbar">
            <div class="shop-topbar-inner">
                <a href="<?php echo e(route('shop.index')); ?>" class="shop-logo">Toko Mas Wowo</a>

                <nav class="shop-nav">
                    <?php if(auth()->guard()->check()): ?>
                        <a href="<?php echo e(route('cart.view')); ?>">Keranjang</a>
                        <a href="<?php echo e(route('dashboard')); ?>">Dashboard</a>
                        <span><?php echo e(Auth::user()->name); ?></span>
                        <form method="POST" action="<?php echo e(route('logout')); ?>">
                            <?php echo csrf_field(); ?>
                            <button type="submit" class="btn btn-soft btn-xs">Logout</button>
                        </form>
                    <?php else: ?>
                        <a href="<?php echo e(route('login')); ?>" class="btn btn-primary btn-xs">Login</a>
                    <?php endif; ?>
                </nav>
            </div>
        </header>

        <main class="shop-shell">
            <section class="shop-hero">
                <div>
                    <p class="eyebrow">Etalase Mas Wowo</p>
                    <h1>Pak Cokomi bisa belanja produk toko dengan gampang.</h1>
                    <p class="muted large">Pilih produk aktif, masukkan ke keranjang, lalu checkout. Stok otomatis berkurang setelah pembelian berhasil.</p>
                </div>
                <div class="shop-hero-actions">
                    <?php if(auth()->guard()->check()): ?>
                        <a href="<?php echo e(route('cart.view')); ?>" class="btn btn-secondary">Lihat Keranjang</a>
                    <?php else: ?>
                        <a href="<?php echo e(route('login')); ?>" class="btn btn-secondary">Login untuk Belanja</a>
                    <?php endif; ?>
                </div>
            </section>

            <section class="shop-layout">
                <aside class="shop-filter">
                    <form method="GET" action="<?php echo e(route('shop.index')); ?>">
                        <div class="field-group">
                            <label for="search">Cari produk</label>
                            <input id="search" type="text" name="search" placeholder="Nama, SKU, deskripsi..." value="<?php echo e($search); ?>">
                        </div>

                        <?php if($categories->count() > 0): ?>
                            <div class="shop-filter-group">
                                <p>Kategori</p>
                                <label>
                                    <input type="radio" name="category" value="" <?php echo e(!$selected_category ? 'checked' : ''); ?>>
                                    <span>Semua kategori</span>
                                </label>
                                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <label>
                                        <input type="radio" name="category" value="<?php echo e($category); ?>" <?php echo e($selected_category === $category ? 'checked' : ''); ?>>
                                        <span><?php echo e($category); ?></span>
                                    </label>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        <?php endif; ?>

                        <button type="submit" class="btn btn-primary">Terapkan Filter</button>
                    </form>
                </aside>

                <section class="shop-products">
                    <?php if(session('success')): ?>
                        <div class="alert-success"><?php echo e(session('success')); ?></div>
                    <?php endif; ?>

                    <?php if(session('error')): ?>
                        <div class="alert-error"><?php echo e(session('error')); ?></div>
                    <?php endif; ?>

                    <div class="page-heading space-between">
                        <div>
                            <p class="eyebrow">Produk tersedia</p>
                            <h2><?php echo e($search ? 'Hasil pencarian' : 'Belanja produk'); ?></h2>
                            <p class="muted"><?php echo e($products->total()); ?> produk cocok dengan pilihan saat ini.</p>
                        </div>
                    </div>

                    <?php if($products->count() > 0): ?>
                        <div class="shop-grid">
                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <article class="shop-product-card">
                                    <div class="product-mark">
                                        <span><?php echo e(strtoupper(substr($product->name, 0, 1))); ?></span>
                                    </div>

                                    <div class="shop-product-body">
                                        <div>
                                            <span class="status-pill <?php echo e($product->stock > 0 ? 'active' : 'inactive'); ?>">
                                                <?php echo e($product->stock > 0 ? 'Tersedia' : 'Habis'); ?>

                                            </span>
                                            <h3><?php echo e($product->name); ?></h3>
                                            <p class="row-note">SKU: <?php echo e($product->sku); ?></p>
                                            <p class="muted"><?php echo e(Str::limit($product->description, 78)); ?></p>
                                        </div>

                                        <div>
                                            <strong class="product-price"><?php echo e($product->formatted_price); ?></strong>
                                            <p class="row-note">Stok: <?php echo e($product->stock); ?></p>

                                            <?php if(auth()->guard()->check()): ?>
                                                <form method="POST" action="<?php echo e(route('cart.add', $product)); ?>" class="buy-row">
                                                    <?php echo csrf_field(); ?>
                                                    <input type="number" name="quantity" value="1" min="1" max="<?php echo e(max($product->stock, 1)); ?>" <?php echo e($product->stock === 0 ? 'disabled' : ''); ?>>
                                                    <button type="submit" class="btn btn-primary" <?php echo e($product->stock === 0 ? 'disabled' : ''); ?>>
                                                        Beli
                                                    </button>
                                                </form>
                                            <?php else: ?>
                                                <a href="<?php echo e(route('login')); ?>" class="btn btn-primary full-button">Login dulu</a>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </article>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>

                        <div class="pagination-wrap">
                            <?php echo e($products->links()); ?>

                        </div>
                    <?php else: ?>
                        <div class="empty-state shop-empty">
                            <h3>Produk tidak ditemukan</h3>
                            <p class="muted">Coba ubah kata kunci atau pilih kategori lain.</p>
                        </div>
                    <?php endif; ?>
                </section>
            </section>
        </main>
    </body>
</html>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/shop/index.blade.php ENDPATH**/ ?>