<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
        <title><?php echo e(config('app.name', 'Inventari Toko')); ?></title>
        <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
    </head>
    <body>
        <div class="shell-bg"></div>
        <div class="app-shell">
            <aside class="sidebar-card">
                <div>
                    <p class="eyebrow">Inventari Toko</p>
                    <h1>Pak Cokomi <span>&</span> Mas Wowo</h1>
                    <p class="muted">Kelola produk toko dengan tampilan yang lembut, jelas, dan rapi.</p>
                </div>

                <nav class="nav-stack">
                    <a href="<?php echo e(route('dashboard')); ?>" class="nav-link <?php echo e(request()->routeIs('dashboard') ? 'active' : ''); ?>">Dashboard</a>
                    <a href="<?php echo e(route('products.index')); ?>" class="nav-link <?php echo e(request()->routeIs('products.*') ? 'active' : ''); ?>">Produk</a>
                    <a href="<?php echo e(route('shop.index')); ?>" class="nav-link <?php echo e(request()->routeIs('shop.*') ? 'active' : ''); ?>">Belanja</a>
                    <a href="<?php echo e(route('cart.view')); ?>" class="nav-link <?php echo e(request()->routeIs('cart.*') ? 'active' : ''); ?>">Keranjang</a>
                </nav>

                <div class="profile-box">
                    <div>
                        <strong><?php echo e(Auth::user()->name); ?></strong>
                        <p><?php echo e(Auth::user()->email); ?></p>
                    </div>
                    <form method="POST" action="<?php echo e(route('logout')); ?>">
                        <?php echo csrf_field(); ?>
                        <button class="btn btn-soft" type="submit">Logout</button>
                    </form>
                </div>
            </aside>

            <main class="content-area">
                <?php if(session('success')): ?>
                    <div class="alert-success"><?php echo e(session('success')); ?></div>
                <?php endif; ?>

                <?php echo e($slot ?? ''); ?>

                <?php echo $__env->yieldContent('content'); ?>
            </main>
        </div>
    </body>
</html>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/layouts/app.blade.php ENDPATH**/ ?>