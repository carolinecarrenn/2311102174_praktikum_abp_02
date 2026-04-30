<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag;

$__newAttributes = [];
$__propNames = \Illuminate\View\ComponentAttributeBag::extractPropNames(([
    'title' => 'Dashboard Toko',
    'subtitle' => 'Kelola stok, produk, dan aktivitas toko dari satu tempat yang lebih rapi.',
]));

foreach ($attributes->all() as $__key => $__value) {
    if (in_array($__key, $__propNames)) {
        $$__key = $$__key ?? $__value;
    } else {
        $__newAttributes[$__key] = $__value;
    }
}

$attributes = new \Illuminate\View\ComponentAttributeBag($__newAttributes);

unset($__propNames);
unset($__newAttributes);

foreach (array_filter(([
    'title' => 'Dashboard Toko',
    'subtitle' => 'Kelola stok, produk, dan aktivitas toko dari satu tempat yang lebih rapi.',
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
}

$__defined_vars = get_defined_vars();

foreach ($attributes->all() as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
}

unset($__defined_vars, $__key, $__value); ?>

<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

        <title><?php echo e(config('app.name', 'Laravel')); ?></title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
    </head>
    <body class="auth-body">
        <main class="auth-shell">
            <section class="auth-brand-panel" aria-label="Inventari Toko">
                <a class="auth-logo" href="<?php echo e(route('shop.index')); ?>">CW</a>

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

            <section class="auth-card" aria-label="<?php echo e($title); ?>">
                <div class="auth-card-heading">
                    <p class="eyebrow">Masuk admin</p>
                    <h2><?php echo e($title); ?></h2>
                    <p><?php echo e($subtitle); ?></p>
                </div>

                <?php echo e($slot); ?>

            </section>
        </main>
    </body>
</html>
<?php /**PATH C:\Users\MSI\Downloads\inventari-toko-cokomi-wowo-pastel\inventari-toko\resources\views/layouts/guest.blade.php ENDPATH**/ ?>