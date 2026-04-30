@props([
    'title' => 'Dashboard Toko',
    'subtitle' => 'Kelola stok, produk, dan aktivitas toko dari satu tempat yang lebih rapi.',
])

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="auth-body">
        <main class="auth-shell">
            <section class="auth-brand-panel" aria-label="Inventari Toko">
                <a class="auth-logo" href="{{ route('shop.index') }}">CW</a>

                <div>
                    <p class="eyebrow">Inventari Toko</p>
                    <h1>Pak Cokomi & Mas Wowo</h1>
                    <p class="muted large">Ruang kerja untuk menjaga produk tetap tertata, stok gampang dipantau, dan toko terasa lebih hidup.</p>
                </div>

                <div class="auth-preview">
                    <div>
                        <span>Stok rapi</span>
                        <strong>10+</strong>
                    </div>
                    <div>
                        <span>Aksi cepat</span>
                        <strong>2x</strong>
                    </div>
                    <div>
                        <span>Siap kerja</span>
                        <strong>Rapi</strong>
                    </div>
                </div>
            </section>

            <section class="auth-card" aria-label="{{ $title }}">
                <div class="auth-card-heading">
                    <p class="eyebrow">Masuk admin</p>
                    <h2>{{ $title }}</h2>
                    <p>{{ $subtitle }}</p>
                </div>

                {{ $slot }}
            </section>
        </main>
    </body>
</html>
