<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ config('app.name', 'Inventari Toko') }}</title>
        @vite(['resources/css/app.css', 'resources/js/app.js'])
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
                    <a href="{{ route('dashboard') }}" class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}">Dashboard</a>
                    <a href="{{ route('products.index') }}" class="nav-link {{ request()->routeIs('products.*') ? 'active' : '' }}">Produk</a>
                    <a href="{{ route('shop.index') }}" class="nav-link {{ request()->routeIs('shop.*') ? 'active' : '' }}">Belanja</a>
                    <a href="{{ route('cart.view') }}" class="nav-link {{ request()->routeIs('cart.*') ? 'active' : '' }}">Keranjang</a>
                </nav>

                <div class="profile-box">
                    <div>
                        <strong>{{ Auth::user()->name }}</strong>
                        <p>{{ Auth::user()->email }}</p>
                    </div>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button class="btn btn-soft" type="submit">Logout</button>
                    </form>
                </div>
            </aside>

            <main class="content-area">
                @if (session('success'))
                    <div class="alert-success">{{ session('success') }}</div>
                @endif

                {{ $slot ?? '' }}
                @yield('content')
            </main>
        </div>
    </body>
</html>
