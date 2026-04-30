<x-app-layout>
    <section class="summary-grid">
        <article class="summary-card blue">
            <span>Total Produk</span>
            <strong>{{ $summary['total'] }}</strong>
        </article>
        <article class="summary-card pink">
            <span>Produk Aktif</span>
            <strong>{{ $summary['active'] }}</strong>
        </article>
        <article class="summary-card lilac">
            <span>Stok Menipis</span>
            <strong>{{ $summary['low_stock'] }}</strong>
        </article>
    </section>

    <section class="page-card">
        <div class="page-heading space-between">
            <div>
                <p class="eyebrow">Daftar produk</p>
                <h2>Inventaris toko</h2>
                <p class="muted">Kelola stok dengan tampilan tabel yang lebih bersih dan nyaman dilihat.</p>
            </div>
            <a href="{{ route('products.create') }}" class="btn btn-primary">+ Tambah Produk</a>
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
                    @forelse ($products as $product)
                        <tr>
                            <td>
                                <strong>{{ $product->name }}</strong>
                                <p class="row-note">{{ Str::limit($product->description, 40) }}</p>
                            </td>
                            <td>{{ $product->sku }}</td>
                            <td>{{ $product->category }}</td>
                            <td>{{ $product->stock }}</td>
                            <td>{{ $product->formatted_price }}</td>
                            <td>
                                <span class="status-pill {{ $product->is_active ? 'active' : 'inactive' }}">
                                    {{ $product->is_active ? 'Aktif' : 'Nonaktif' }}
                                </span>
                            </td>
                            <td>
                                <div class="action-row">
                                    <a href="{{ route('products.edit', $product) }}" class="btn btn-xs btn-secondary">Edit</a>
                                    <button
                                        type="button"
                                        class="btn btn-xs btn-danger openDeleteModal"
                                        data-name="{{ $product->name }}"
                                        data-action="{{ route('products.destroy', $product) }}"
                                    >Hapus</button>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7">
                                <div class="empty-state">
                                    <h3>Belum ada produk</h3>
                                    <p>Yuk isi inventaris dulu biar toko mas Wowo makin siap belanja.</p>
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="pagination-wrap">
            {{ $products->links() }}
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
                    @csrf
                    @method('DELETE')
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
</x-app-layout>
