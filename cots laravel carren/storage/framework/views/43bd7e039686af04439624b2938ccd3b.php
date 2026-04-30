<?php if (isset($component)) { $__componentOriginal9ac128a9029c0e4701924bd2d73d7f54 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54 = $attributes; } ?>
<?php $component = App\View\Components\AppLayout::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('app-layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\AppLayout::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <?php
        $totalProducts = max((int) $summary['total'], 1);
        $activeRate = round(((int) $summary['active'] / $totalProducts) * 100);
        $firstLowStock = $lowStockProducts->first();
    ?>

    <section class="dashboard-hero">
        <div class="dashboard-copy">
            <p class="eyebrow">Gudang Toko Mas Wowo</p>
            <h2><?php echo e($summary['total']); ?> SKU tercatat, <?php echo e($summary['low_stock']); ?> produk perlu restock.</h2>
            <p class="muted large">
                <?php if($firstLowStock): ?>
                    Prioritas hari ini: cek <?php echo e($firstLowStock->name); ?> karena stoknya tinggal <?php echo e($firstLowStock->stock); ?>.
                <?php else: ?>
                    Stok aman untuk hari ini. Tambahkan produk baru kalau ada barang masuk dari supplier.
                <?php endif; ?>
            </p>
            <div class="hero-actions">
                <a href="<?php echo e(route('products.index')); ?>" class="btn btn-primary">Buka Data Produk</a>
                <a href="<?php echo e(route('products.create')); ?>" class="btn btn-secondary">Input Barang Masuk</a>
            </div>
        </div>

        <div class="dashboard-focus stock-alert-card">
            <div class="stock-alert-head">
                <span>Stok kritis</span>
                <strong><?php echo e($summary['low_stock']); ?></strong>
                <p><?php echo e($summary['empty_stock']); ?> produk sudah kosong.</p>
            </div>

            <div class="stock-alert-list">
                <?php $__empty_1 = true; $__currentLoopData = $lowStockProducts->take(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <a href="<?php echo e(route('products.edit', $product)); ?>">
                        <span><?php echo e($product->name); ?></span>
                        <strong><?php echo e($product->stock); ?> tersisa</strong>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <div class="stock-safe-note">Tidak ada produk di bawah 6 stok.</div>
                <?php endif; ?>
            </div>
        </div>
    </section>

    <section class="dashboard-summary">
        <article class="summary-card blue">
            <span>Total produk</span>
            <strong><?php echo e($summary['total']); ?></strong>
            <p>Semua item yang terdaftar.</p>
        </article>
        <article class="summary-card pink">
            <span>Produk aktif</span>
            <strong><?php echo e($summary['active']); ?></strong>
            <p><?php echo e($activeRate); ?>% dari seluruh SKU.</p>
        </article>
        <article class="summary-card mint">
            <span>Total unit stok</span>
            <strong><?php echo e(number_format($summary['stock_units'], 0, ',', '.')); ?></strong>
            <p>Tersebar di <?php echo e($summary['categories']); ?> kategori.</p>
        </article>
    </section>

    <section class="dashboard-panels">
        <div class="page-card dashboard-table-card">
            <div class="page-heading space-between">
                <div>
                    <p class="eyebrow">Aktivitas produk</p>
                    <h2>Produk terbaru</h2>
                </div>
                <a href="<?php echo e(route('products.index')); ?>" class="btn btn-soft">Kelola semua</a>
            </div>

            <div class="table-wrap">
                <table class="pretty-table compact-table">
                    <thead>
                        <tr>
                            <th>Produk</th>
                            <th>Stok</th>
                            <th>Status</th>
                            <th>Harga</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__empty_1 = true; $__currentLoopData = $recentProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td>
                                    <strong><?php echo e($product->name); ?></strong>
                                    <p class="row-note"><?php echo e($product->sku); ?></p>
                                </td>
                                <td><?php echo e($product->stock); ?></td>
                                <td>
                                    <span class="status-pill <?php echo e($product->is_active ? 'active' : 'inactive'); ?>">
                                        <?php echo e($product->is_active ? 'Aktif' : 'Nonaktif'); ?>

                                    </span>
                                </td>
                                <td><?php echo e($product->formatted_price); ?></td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <tr>
                                <td colspan="4">
                                    <div class="empty-state">
                                        <h3>Belum ada produk</h3>
                                        <p class="muted">Tambah produk pertama supaya dashboard mulai terisi.</p>
                                    </div>
                                </td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <aside class="page-card dashboard-checklist">
            <p class="eyebrow">Daftar Restock</p>
            <h2>Yang harus dibeli lagi</h2>
            <div class="restock-list">
                <?php $__empty_1 = true; $__currentLoopData = $lowStockProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <a href="<?php echo e(route('products.edit', $product)); ?>" class="restock-item">
                        <div>
                            <strong><?php echo e($product->name); ?></strong>
                            <p><?php echo e($product->category); ?> - <?php echo e($product->sku); ?></p>
                        </div>
                        <span><?php echo e($product->stock); ?></span>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <div class="restock-empty">
                        <strong>Stok aman</strong>
                        <p>Tidak ada produk dengan stok 5 ke bawah.</p>
                    </div>
                <?php endif; ?>
            </div>
        </aside>
    </section>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54)): ?>
<?php $attributes = $__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54; ?>
<?php unset($__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal9ac128a9029c0e4701924bd2d73d7f54)): ?>
<?php $component = $__componentOriginal9ac128a9029c0e4701924bd2d73d7f54; ?>
<?php unset($__componentOriginal9ac128a9029c0e4701924bd2d73d7f54); ?>
<?php endif; ?>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/dashboard.blade.php ENDPATH**/ ?>