<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Keranjang - Toko Mas Wowo</title>
        <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
    </head>
    <body class="shop-body">
        <header class="shop-topbar">
            <div class="shop-topbar-inner">
                <a href="<?php echo e(route('shop.index')); ?>" class="shop-logo">Toko Mas Wowo</a>

                <nav class="shop-nav">
                    <a href="<?php echo e(route('shop.index')); ?>">Belanja</a>
                    <a href="<?php echo e(route('dashboard')); ?>">Dashboard</a>
                    <span><?php echo e(Auth::user()->name); ?></span>
                    <form method="POST" action="<?php echo e(route('logout')); ?>">
                        <?php echo csrf_field(); ?>
                        <button type="submit" class="btn btn-soft btn-xs">Logout</button>
                    </form>
                </nav>
            </div>
        </header>

        <main class="shop-shell">
            <section class="shop-hero compact">
                <div>
                    <p class="eyebrow">Keranjang belanja</p>
                    <h1>Pesanan Pak Cokomi sebelum checkout.</h1>
                    <p class="muted large">Cek jumlah item, total belanja, lalu checkout untuk mengurangi stok produk secara otomatis.</p>
                </div>
                <a href="<?php echo e(route('shop.index')); ?>" class="btn btn-secondary">Lanjut Belanja</a>
            </section>

            <?php if(session('error')): ?>
                <div class="alert-error"><?php echo e(session('error')); ?></div>
            <?php endif; ?>

            <?php if($carts->count() > 0): ?>
                <section class="cart-layout">
                    <div class="cart-list">
                        <?php $__currentLoopData = $carts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cart): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <article class="cart-item-card">
                                <div class="product-mark small">
                                    <span><?php echo e(strtoupper(substr($cart->product->name, 0, 1))); ?></span>
                                </div>

                                <div class="cart-item-main">
                                    <h2><?php echo e($cart->product->name); ?></h2>
                                    <p class="row-note">SKU: <?php echo e($cart->product->sku); ?></p>
                                    <p class="muted"><?php echo e($cart->quantity); ?> x <?php echo e($cart->product->formatted_price); ?></p>
                                </div>

                                <div class="cart-item-actions">
                                    <strong>Rp <?php echo e(number_format($cart->subtotal, 0, ',', '.')); ?></strong>
                                    <form method="POST" action="<?php echo e(route('cart.remove', $cart)); ?>">
                                        <?php echo csrf_field(); ?>
                                        <?php echo method_field('DELETE'); ?>
                                        <button type="submit" class="btn btn-danger btn-xs">Hapus</button>
                                    </form>
                                </div>
                            </article>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>

                    <aside class="cart-summary">
                        <p class="eyebrow">Ringkasan</p>
                        <h2>Total pesanan</h2>

                        <div class="summary-line">
                            <span>Total item</span>
                            <strong><?php echo e($carts->sum('quantity')); ?></strong>
                        </div>
                        <div class="summary-line total">
                            <span>Subtotal</span>
                            <strong>Rp <?php echo e(number_format($total, 0, ',', '.')); ?></strong>
                        </div>

                        <form method="POST" action="<?php echo e(route('checkout')); ?>">
                            <?php echo csrf_field(); ?>
                            <button type="submit" class="btn btn-primary full-button">Checkout</button>
                        </form>
                    </aside>
                </section>
            <?php else: ?>
                <section class="empty-state shop-empty">
                    <h3>Keranjang masih kosong</h3>
                    <p class="muted">Tambahkan produk dari etalase Mas Wowo dulu.</p>
                    <a href="<?php echo e(route('shop.index')); ?>" class="btn btn-primary">Belanja Sekarang</a>
                </section>
            <?php endif; ?>
        </main>
    </body>
</html>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/shop/cart.blade.php ENDPATH**/ ?>