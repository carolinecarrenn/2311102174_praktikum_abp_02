<x-app-layout>
    <section class="page-card">
        <div class="page-heading">
            <div>
                <p class="eyebrow">Edit produk</p>
                <h2>Perbarui data {{ $product->name }}</h2>
            </div>
        </div>

        <form method="POST" action="{{ route('products.update', $product) }}">
            @csrf
            @method('PUT')
            @include('products._form', ['product' => $product])
        </form>
    </section>
</x-app-layout>
