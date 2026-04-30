<x-app-layout>
    @php
        $totalProducts = max((int) $summary['total'], 1);
        $activeRate = round(((int) $summary['active'] / $totalProducts) * 100);
        $firstLowStock = $lowStockProducts->first();
    @endphp

    <section class="dashboard-hero">
        <div class="dashboard-copy">
            <p class="eyebrow">Gudang Toko Mas Wowo</p>
            <h2>{{ $summary['total'] }} SKU tercatat, {{ $summary['low_stock'] }} produk perlu restock.</h2>
            <p class="muted large">
                @if ($firstLowStock)
                    Prioritas hari ini: cek {{ $firstLowStock->name }} karena stoknya tinggal {{ $firstLowStock->stock }}.
                @else
                    Stok aman untuk hari ini. Tambahkan produk baru kalau ada barang masuk dari supplier.
                @endif
            </p>
            <div class="hero-actions">
                <a href="{{ route('products.index') }}" class="btn btn-primary">Buka Data Produk</a>
                <a href="{{ route('products.create') }}" class="btn btn-secondary">Input Barang Masuk</a>
            </div>
        </div>

        <div class="dashboard-focus stock-alert-card">
            <div class="stock-alert-head">
                <span>Stok kritis</span>
                <strong>{{ $summary['low_stock'] }}</strong>
                <p>{{ $summary['empty_stock'] }} produk sudah kosong.</p>
            </div>

            <div class="stock-alert-list">
                @forelse ($lowStockProducts->take(3) as $product)
                    <a href="{{ route('products.edit', $product) }}">
                        <span>{{ $product->name }}</span>
                        <strong>{{ $product->stock }} tersisa</strong>
                    </a>
                @empty
                    <div class="stock-safe-note">Tidak ada produk di bawah 6 stok.</div>
                @endforelse
            </div>
        </div>
    </section>

    <section class="dashboard-summary">
        <article class="summary-card blue">
            <span>Total produk</span>
            <strong>{{ $summary['total'] }}</strong>
            <p>Semua item yang terdaftar.</p>
        </article>
        <article class="summary-card pink">
            <span>Produk aktif</span>
            <strong>{{ $summary['active'] }}</strong>
            <p>{{ $activeRate }}% dari seluruh SKU.</p>
        </article>
        <article class="summary-card mint">
            <span>Total unit stok</span>
            <strong>{{ number_format($summary['stock_units'], 0, ',', '.') }}</strong>
            <p>Tersebar di {{ $summary['categories'] }} kategori.</p>
        </article>
    </section>

    <section class="dashboard-panels">
        <div class="page-card dashboard-table-card">
            <div class="page-heading space-between">
                <div>
                    <p class="eyebrow">Aktivitas produk</p>
                    <h2>Produk terbaru</h2>
                </div>
                <a href="{{ route('products.index') }}" class="btn btn-soft">Kelola semua</a>
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
                        @forelse ($recentProducts as $product)
                            <tr>
                                <td>
                                    <strong>{{ $product->name }}</strong>
                                    <p class="row-note">{{ $product->sku }}</p>
                                </td>
                                <td>{{ $product->stock }}</td>
                                <td>
                                    <span class="status-pill {{ $product->is_active ? 'active' : 'inactive' }}">
                                        {{ $product->is_active ? 'Aktif' : 'Nonaktif' }}
                                    </span>
                                </td>
                                <td>{{ $product->formatted_price }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4">
                                    <div class="empty-state">
                                        <h3>Belum ada produk</h3>
                                        <p class="muted">Tambah produk pertama supaya dashboard mulai terisi.</p>
                                    </div>
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        <aside class="page-card dashboard-checklist">
            <p class="eyebrow">Daftar Restock</p>
            <h2>Yang harus dibeli lagi</h2>
            <div class="restock-list">
                @forelse ($lowStockProducts as $product)
                    <a href="{{ route('products.edit', $product) }}" class="restock-item">
                        <div>
                            <strong>{{ $product->name }}</strong>
                            <p>{{ $product->category }} - {{ $product->sku }}</p>
                        </div>
                        <span>{{ $product->stock }}</span>
                    </a>
                @empty
                    <div class="restock-empty">
                        <strong>Stok aman</strong>
                        <p>Tidak ada produk dengan stok 5 ke bawah.</p>
                    </div>
                @endforelse
            </div>
        </aside>
    </section>
</x-app-layout>
