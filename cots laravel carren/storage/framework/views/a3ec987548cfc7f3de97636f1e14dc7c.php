<?php
    $editing = isset($product);
?>

<div class="form-grid">
    <div class="field-group">
        <label for="name">Nama Produk</label>
        <input id="name" name="name" type="text" value="<?php echo e(old('name', $product->name ?? '')); ?>" required>
        <?php $__errorArgs = ['name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="field-group">
        <label for="sku">SKU</label>
        <input id="sku" name="sku" type="text" value="<?php echo e(old('sku', $product->sku ?? '')); ?>" required>
        <?php $__errorArgs = ['sku'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="field-group">
        <label for="category">Kategori</label>
        <input id="category" name="category" type="text" value="<?php echo e(old('category', $product->category ?? '')); ?>" required>
        <?php $__errorArgs = ['category'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="field-group">
        <label for="stock">Stok</label>
        <input id="stock" name="stock" type="number" min="0" value="<?php echo e(old('stock', $product->stock ?? 0)); ?>" required>
        <?php $__errorArgs = ['stock'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="field-group full-width">
        <label for="price">Harga</label>
        <input id="price" name="price" type="number" min="0" step="0.01" value="<?php echo e(old('price', $product->price ?? 0)); ?>" required>
        <?php $__errorArgs = ['price'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="field-group full-width">
        <label for="description">Deskripsi</label>
        <textarea id="description" name="description" rows="5"><?php echo e(old('description', $product->description ?? '')); ?></textarea>
        <?php $__errorArgs = ['description'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <small class="error-text"><?php echo e($message); ?></small> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <label class="toggle-row full-width">
        <input type="checkbox" name="is_active" value="1" <?php echo e(old('is_active', $product->is_active ?? true) ? 'checked' : ''); ?>>
        <span>Produk aktif dan ditampilkan di inventaris</span>
    </label>
</div>

<div class="page-actions">
    <a href="<?php echo e(route('products.index')); ?>" class="btn btn-soft">Kembali</a>
    <button type="submit" class="btn btn-primary"><?php echo e($editing ? 'Simpan Perubahan' : 'Simpan Produk'); ?></button>
</div>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/products/_form.blade.php ENDPATH**/ ?>