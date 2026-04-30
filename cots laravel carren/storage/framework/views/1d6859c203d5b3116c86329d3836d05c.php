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
    <section class="summary-grid">
        <article class="summary-card blue">
            <span>Total Produk</span>
            <strong><?php echo e($summary['total']); ?></strong>
        </article>
        <article class="summary-card pink">
            <span>Produk Aktif</span>
            <strong><?php echo e($summary['active']); ?></strong>
        </article>
        <article class="summary-card lilac">
            <span>Stok Menipis</span>
            <strong><?php echo e($summary['low_stock']); ?></strong>
        </article>
    </section>

    <section class="page-card">
        <div class="page-heading space-between">
            <div>
                <p class="eyebrow">Daftar produk</p>
                <h2>Inventaris toko</h2>
                <p class="muted">Kelola stok dengan tampilan tabel yang lebih bersih dan nyaman dilihat.</p>
            </div>
            <a href="<?php echo e(route('products.create')); ?>" class="btn btn-primary">+ Tambah Produk</a>
        </div>

        <div class="toolbar-row">
            <input type="text" id="searchInput" class="table-search" placeholder="Cari nama, SKU, kategori...">
        </div>

        <div class="table-wrap">
            <table class="pretty-table" id="productsTable">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>SKU</th>
                        <th>Kategori</th>
                        <th>Stok</th>
                        <th>Harga</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <tr>
                            <td>
                                <strong><?php echo e($product->name); ?></strong>
                                <p class="row-note"><?php echo e(Str::limit($product->description, 40)); ?></p>
                            </td>
                            <td><?php echo e($product->sku); ?></td>
                            <td><?php echo e($product->category); ?></td>
                            <td><?php echo e($product->stock); ?></td>
                            <td><?php echo e($product->formatted_price); ?></td>
                            <td>
                                <span class="status-pill <?php echo e($product->is_active ? 'active' : 'inactive'); ?>">
                                    <?php echo e($product->is_active ? 'Aktif' : 'Nonaktif'); ?>

                                </span>
                            </td>
                            <td>
                                <div class="action-row">
                                    <a href="<?php echo e(route('products.edit', $product)); ?>" class="btn btn-xs btn-secondary">Edit</a>
                                    <button
                                        type="button"
                                        class="btn btn-xs btn-danger openDeleteModal"
                                        data-name="<?php echo e($product->name); ?>"
                                        data-action="<?php echo e(route('products.destroy', $product)); ?>"
                                    >Hapus</button>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <tr>
                            <td colspan="7">
                                <div class="empty-state">
                                    <h3>Belum ada produk</h3>
                                    <p>Yuk isi inventaris dulu biar toko mas Wowo makin siap belanja.</p>
                                </div>
                            </td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

        <div class="pagination-wrap">
            <?php echo e($products->links()); ?>

        </div>
    </section>

    <div id="deleteModal" class="modal-backdrop hidden">
        <div class="modal-card">
            <p class="eyebrow">Konfirmasi hapus</p>
            <h3>Hapus produk <span id="productName"></span>?</h3>
            <p class="muted">Data yang dihapus tidak bisa dikembalikan lagi.</p>

            <div class="page-actions">
                <button type="button" id="closeModal" class="btn btn-soft">Batal</button>
                <form id="deleteForm" method="POST">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('DELETE'); ?>
                    <button type="submit" class="btn btn-danger">Ya, hapus</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const searchInput = document.getElementById('searchInput');
            const table = document.getElementById('productsTable');
            const rows = Array.from(table.querySelectorAll('tbody tr'));
            const modal = document.getElementById('deleteModal');
            const deleteForm = document.getElementById('deleteForm');
            const productName = document.getElementById('productName');

            searchInput?.addEventListener('keyup', function () {
                const keyword = this.value.toLowerCase();
                rows.forEach(row => {
                    row.style.display = row.innerText.toLowerCase().includes(keyword) ? '' : 'none';
                });
            });

            document.querySelectorAll('.openDeleteModal').forEach(button => {
                button.addEventListener('click', () => {
                    deleteForm.action = button.dataset.action;
                    productName.textContent = button.dataset.name;
                    modal.classList.remove('hidden');
                });
            });

            document.getElementById('closeModal')?.addEventListener('click', () => modal.classList.add('hidden'));
            modal?.addEventListener('click', (e) => {
                if (e.target === modal) {
                    modal.classList.add('hidden');
                }
            });
        });
    </script>
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
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/products/index.blade.php ENDPATH**/ ?>