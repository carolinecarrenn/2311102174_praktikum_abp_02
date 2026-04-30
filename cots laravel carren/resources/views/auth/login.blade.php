<x-guest-layout
    title="Masuk dashboard"
    subtitle="Gunakan akun admin untuk melihat stok, mengatur produk, dan menjaga toko tetap siap jual."
>
    <!-- Session Status -->
    <x-auth-session-status class="auth-status" :status="session('status')" />

    <form class="auth-form" method="POST" action="{{ route('login') }}">
        @csrf

        <!-- Email Address -->
        <label class="auth-field" for="email">
            <span>Email admin</span>
            <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username" placeholder="admin@toko.test">
        </label>
        <x-input-error :messages="$errors->get('email')" class="auth-error" />

        <!-- Password -->
        <label class="auth-field" for="password">
            <span>Password</span>
            <input id="password" type="password" name="password" required autocomplete="current-password" placeholder="Masukkan password">
        </label>
        <x-input-error :messages="$errors->get('password')" class="auth-error" />

        <!-- Remember Me -->
        <div class="auth-options">
            <label for="remember_me" class="auth-check">
                <input id="remember_me" type="checkbox" name="remember">
                <span>Ingat saya</span>
            </label>

            @if (Route::has('password.request'))
                <a class="auth-link" href="{{ route('password.request') }}">
                    Lupa password?
                </a>
            @endif
        </div>

        <button class="auth-submit" type="submit">
            Masuk sekarang
        </button>
    </form>
</x-guest-layout>
