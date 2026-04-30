@php
    $editing = isset($product);
@endphp

<div class="form-grid">
    <div class="field-group">
        <label for="name">Nama Produk</label>
        <input id="name" name="name" type="text" value="{{ old('name', $product->name ?? '') }}" required>
        @error('name') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <div class="field-group">
        <label for="sku">SKU</label>
        <input id="sku" name="sku" type="text" value="{{ old('sku', $product->sku ?? '') }}" required>
        @error('sku') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <div class="field-group">
        <label for="category">Kategori</label>
        <input id="category" name="category" type="text" value="{{ old('category', $product->category ?? '') }}" required>
        @error('category') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <div class="field-group">
        <label for="stock">Stok</label>
        <input id="stock" name="stock" type="number" min="0" value="{{ old('stock', $product->stock ?? 0) }}" required>
        @error('stock') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <div class="field-group full-width">
        <label for="price">Harga</label>
        <input id="price" name="price" type="number" min="0" step="0.01" value="{{ old('price', $product->price ?? 0) }}" required>
        @error('price') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <div class="field-group full-width">
        <label for="description">Deskripsi</label>
        <textarea id="description" name="description" rows="5">{{ old('description', $product->description ?? '') }}</textarea>
        @error('description') <small class="error-text">{{ $message }}</small> @enderror
    </div>

    <label class="toggle-row full-width">
        <input type="checkbox" name="is_active" value="1" {{ old('is_active', $product->is_active ?? true) ? 'checked' : '' }}>
        <span>Produk aktif dan ditampilkan di inventaris</span>
    </label>
</div>

<div class="page-actions">
    <a href="{{ route('products.index') }}" class="btn btn-soft">Kembali</a>
    <button type="submit" class="btn btn-primary">{{ $editing ? 'Simpan Perubahan' : 'Simpan Produk' }}</button>
</div>
