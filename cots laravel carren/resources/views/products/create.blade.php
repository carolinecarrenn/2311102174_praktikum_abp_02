<x-app-layout>
    <section class="page-card">
        <div class="page-heading">
            <div>
                <p class="eyebrow">Tambah produk</p>
                <h2>Masukkan produk baru ke inventaris</h2>
            </div>
        </div>

        <form method="POST" action="{{ route('products.store') }}">
            @csrf
            @include('products._form')
        </form>
    </section>
</x-app-layout>
