<h2 align="center"><strong>LAPORAN PRAKTIKUM</strong></h2>
<h2 align="center"><strong>APLIKASI BERBASIS PLATFORM</strong></h2>

<br>

<h2 align="center"><strong>MODUL I</strong></h2>
<h2 align="center"><strong> HTML </strong></h2> 

<br>

<p align="center">
  
  <img src="https://github.com/user-attachments/assets/741cb565-774a-4298-b1fb-22ebf35822f1" alt="Logo" width="200"/>

</p>

<br>

<p align="center">
  <strong>Disusun Oleh:</strong><br>
  Caroline Carren A.R / 2311102174<br>
  S1 IF 11 02
</p>

<br>

<p align="center">
  <strong>Dosen Pengampu:</strong><br>
  Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom
</p>

<br>

<p align="center">
  <strong>PROGRAM STUDI S1 TEKNIK INFORMATIKA</strong><br>
  <strong>FAKULTAS INFORMATIKA</strong><br>
  <strong>TELKOM UNIVERSITY PURWOKERTO</strong><br>
  <strong>2026</strong>
</p>

------

## Daftar Isi
1. [Unguided](#unguided)

## Unguided 

### 1.Buatlah sebuah halaman web bertema Ramadan dengan menggunakan framework Bootstrap. Dalam pembuatan halaman tersebut, gunakan komponen dan utility class Bootstrap semaksimal mungkin serta sebisa mungkin tidak menggunakan native CSS.

Halaman web harus memiliki tampilan yang menarik dan responsif. Selain itu, tambahkan sebuah button atau elemen interaktif yang ketika diklik akan menampilkan modal Bootstrap dengan pesan:
“Selamat, Anda mendapatkan THR.”

Buatlah halaman tersebut semenarik dan seinteraktif mungkin dengan memanfaatkan berbagai komponen yang tersedia pada Bootstrap.

### Source Code :
```html
 <!DOCTYPE html>
<html lang="id" data-bs-theme="dark">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ramadan Mubarak 🌙</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700;900&family=Amiri:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
  <style>
    /* ─ TOKENS ─ */
    :root {
      --n1: #020812;
      --n2: #060e1f;
      --n3: #0a1628;
      --n4: #0d1e3a;
      --n5: #1a3a6e;
      --accent: #4e8ef7;
      --accent-lt: #93c5fd;
      --gold: #c9a227;
      --gold-lt: #f0c040;
      --dim: #7a9ab0;
      --mute: #3a5a7a;
      --pale: #a8c0d8;
      --cream: #fde68a;
    }

    /* ─ BASE ─ */
    body              { background-color: var(--n2); font-family: 'Poppins', sans-serif; }

    /* ─ FONTS ─ */
    .ff-cinzel        { font-family: 'Cinzel', serif; }
    .ff-amiri         { font-family: 'Amiri', serif; }

    /* ─ FONT SIZES ─ */
    .fs-arabic        { font-size: clamp(2rem, 5vw, 3rem); }
    .fs-hero          { font-size: clamp(1.8rem, 4vw, 3rem); }
    .fs-cd            { font-size: clamp(2rem, 5vw, 2.8rem); }
    .fs-section       { font-size: clamp(1.4rem, 3vw, 2rem); }
    .fs-thr           { font-size: clamp(2.2rem, 8vw, 3.5rem); }
    .fs-tiny          { font-size: .6rem; }
    .fs-07            { font-size: .7rem; }
    .fs-075           { font-size: .75rem; }
    .fs-16            { font-size: 1.6rem; }
    .moon-size        { font-size: 4.5rem; line-height: 1; }

    /* ─ LETTER SPACING ─ */
    .ls-1             { letter-spacing: 1px; }
    .ls-2             { letter-spacing: 2px; }
    .ls-4             { letter-spacing: 4px; }
    .ls-6             { letter-spacing: 6px; }

    /* ─ LINE HEIGHT ─ */
    .lh-17            { line-height: 1.7; }
    .lh-18            { line-height: 1.8; }
    .lh-20            { line-height: 2.0; }

    /* ─ DIRECTION ─ */
    .dir-rtl          { direction: rtl; }

    /* ─ COLORS ─*/
    .text-accent      { color: var(--accent-lt) !important; }
    .text-accent-dk   { color: var(--accent) !important; }
    .text-gold        { color: var(--gold-lt) !important; }
    .text-gold-dk     { color: var(--gold) !important; }
    .text-dim         { color: var(--dim) !important; }
    .text-mute        { color: var(--mute) !important; }
    .text-pale        { color: var(--pale) !important; }
    .text-cream       { color: var(--cream) !important; }

    /* ─ BACKGROUNDS ─ */
    .bg-n1            { background-color: var(--n1) !important; }
    .bg-n2            { background-color: var(--n2) !important; }
    .bg-n3            { background-color: var(--n3) !important; }
    .bg-n4            { background-color: var(--n4) !important; }
    .bg-hero          { background: radial-gradient(ellipse at top, var(--n5) 0%, var(--n3) 50%, var(--n1) 100%); }
    .bg-card          { background: linear-gradient(145deg, #0f2040, #060e1f); }
    .bg-doa           { background: linear-gradient(135deg, #0a1e2e, #060e1f); }
    .bg-modal         { background: linear-gradient(160deg, #0d1e3a 0%, #060e1f 60%, #0d1e3a 100%); }
    .bg-btn-primary   { background: linear-gradient(135deg, #4e8ef7, #1a56db); }
    .bg-btn-success   { background: linear-gradient(135deg, #22c55e, #16a34a) !important; }
    .bg-bar           { background: linear-gradient(90deg, var(--n4), var(--accent), var(--n4)); }
    .bg-progress      { background: linear-gradient(90deg, var(--accent), var(--accent-lt)); }
    .bg-progress-track{ background: var(--n4); }
    .bg-badge         { background: rgba(78,142,247,.1); }
    .bg-icon          { background: rgba(78,142,247,.1); }
    .bg-cd-wrap       { background: rgba(6,14,31,.9); }
    .bg-cd-block      { background: var(--n4); }

    /* ─ BORDERS ─ */
    .border-accent    { border-color: var(--accent) !important; }
    .border-accent-50 { border-color: rgba(78,142,247,.5) !important; }
    .border-accent-25 { border-color: rgba(78,142,247,.25) !important; }
    .border-accent-15 { border-color: rgba(78,142,247,.15) !important; }
    .border-gold      { border-color: var(--gold) !important; }
    .border-b-accent2 { border-bottom: 2px solid var(--accent); }
    .border-b-accent1 { border-bottom: 1px solid rgba(78,142,247,.2); }
    .border-t-card    { border-top: 2px solid rgba(78,142,247,.4) !important; }

    /* ─ SHADOWS ─ */
    .shadow-card      { box-shadow: 0 4px 24px rgba(0,0,0,.5), 0 0 0 1px rgba(78,142,247,.06); }
    .shadow-btn       { box-shadow: 0 8px 32px rgba(78,142,247,.35) !important; }
    .shadow-modal     { box-shadow: 0 24px 64px rgba(0,0,0,.8) !important; }
    .shadow-cd        { box-shadow: 0 4px 24px rgba(0,0,0,.4), inset 0 1px 0 rgba(78,142,247,.1); }
    .shadow-doa       { box-shadow: 0 8px 40px rgba(0,0,0,.5); }
    .shadow-table     { box-shadow: 0 8px 32px rgba(0,0,0,.4); }
    .shadow-keutamaan { box-shadow: 0 4px 20px rgba(0,0,0,.4); }

    /* ─ TEXT EFFECTS ─ */
    .glow-accent      { text-shadow: 0 0 30px rgba(78,142,247,.45); }
    .glow-gold        { text-shadow: 0 0 30px rgba(201,162,39,.4); }
    .glow-white       { text-shadow: 0 2px 20px rgba(0,0,0,.6); }
    .drop-glow        { filter: drop-shadow(0 0 24px rgba(78,142,247,.5)); }

    /* ── COMPONENTS ──────────────────────────── */
    .cd-block         { min-width: 72px; }
    .icon-box         { width: 52px; height: 52px; font-size: 1.4rem; }
    .progress-h       { height: 10px; }
    .modal-bar        { height: 4px; }
    .btn-min          { min-width: 210px; }
    .ornament-line    { max-width: 80px; }

    /* ─ HOVER ─ */
    .card-hover       { transition: transform .2s ease, box-shadow .2s ease; }
    .card-hover:hover { transform: translateY(-5px); box-shadow: 0 16px 48px rgba(78,142,247,.18), 0 0 0 1px rgba(78,142,247,.25) !important; }

    /* ─ TABLE ─ */
    .table-navy       { --bs-table-bg: transparent; }
    .table-navy thead { background-color: var(--n4); }
    .table-navy tbody tr { transition: background .15s; }
    .table-navy tbody tr:hover td { background: rgba(78,142,247,.06) !important; }

    /* ─ PROGRESS ANIMATION ─ */
    .bar-animate      { transition: width 1.8s ease-in-out; }
    .bar-reset        { transition: none; }
  </style>
</head>

<body class="bg-n2 text-white">

<!-- NAVBAR -->
<nav class="navbar sticky-top navbar-dark bg-n3 border-b-accent2 shadow">
  <div class="container">
    <span class="navbar-brand fw-bold fs-5 text-accent ff-cinzel ls-2">
      🌙 RAMADAN 1447 H
    </span>
    <span class="badge px-3 py-2 fw-semibold rounded-pill bg-btn-primary text-white ls-1">
      Marhaban Ya Ramadan
    </span>
  </div>
</nav>

<!-- HERO -->
<section class="py-5 text-center bg-hero border-b-accent1">
  <div class="container py-5">

    <div class="d-flex justify-content-center align-items-center gap-3 mb-4">
      <div class="flex-grow-1 border-top border-accent-25 opacity-50 ornament-line"></div>
      <span class="fs-1">🏮</span>
      <span class="drop-glow moon-size">🌙</span>
      <span class="fs-1">🏮</span>
      <div class="flex-grow-1 border-top border-accent-25 opacity-50 ornament-line"></div>
    </div>

    <p class="fw-bold mb-1 ff-amiri fs-arabic text-gold glow-gold">
      رَمَضَانُ مُبَارَكٌ
    </p>

    <h1 class="fw-bolder text-uppercase mb-3 ff-cinzel fs-hero ls-6 text-white glow-white">
      Ramadan Mubarak
    </h1>

    <div class="d-flex justify-content-center align-items-center gap-2 mb-4">
      <span class="text-accent opacity-50">✦</span>
      <span class="text-accent">✦</span>
      <span class="text-accent opacity-50">✦</span>
    </div>

    <p class="fw-light mb-5 mx-auto col-md-6 text-pale lh-18 fs-5">
      Selamat menunaikan ibadah puasa. Semoga Ramadan tahun ini membawa keberkahan, rahmat, dan ampunan untuk kita semua.
    </p>

    <!-- Countdown -->
    <div class="d-inline-flex gap-2 gap-md-3 mb-5 p-2 rounded-4 bg-cd-wrap border border-accent-25 shadow-cd">
      <div class="text-center px-3 px-md-4 py-3 rounded-3 bg-cd-block cd-block">
        <div id="cd-hari"  class="fw-bolder lh-1 mb-1 text-accent ff-cinzel fs-cd">00</div>
        <div class="text-uppercase fw-semibold text-mute ls-2 fs-tiny">Hari</div>
      </div>
      <div class="align-self-center fw-bold text-accent opacity-50 fs-4">:</div>
      <div class="text-center px-3 px-md-4 py-3 rounded-3 bg-cd-block cd-block">
        <div id="cd-jam"   class="fw-bolder lh-1 mb-1 text-accent ff-cinzel fs-cd">00</div>
        <div class="text-uppercase fw-semibold text-mute ls-2 fs-tiny">Jam</div>
      </div>
      <div class="align-self-center fw-bold text-accent opacity-50 fs-4">:</div>
      <div class="text-center px-3 px-md-4 py-3 rounded-3 bg-cd-block cd-block">
        <div id="cd-menit" class="fw-bolder lh-1 mb-1 text-accent ff-cinzel fs-cd">00</div>
        <div class="text-uppercase fw-semibold text-mute ls-2 fs-tiny">Menit</div>
      </div>
      <div class="align-self-center fw-bold text-accent opacity-50 fs-4">:</div>
      <div class="text-center px-3 px-md-4 py-3 rounded-3 bg-cd-block cd-block">
        <div id="cd-detik" class="fw-bolder lh-1 mb-1 text-accent ff-cinzel fs-cd">00</div>
        <div class="text-uppercase fw-semibold text-mute ls-2 fs-tiny">Detik</div>
      </div>
    </div>

    <br>

    <button class="btn fw-bold rounded-pill px-5 py-3 border-0 shadow-btn bg-btn-primary text-white ls-1 fs-5"
            data-bs-toggle="modal" data-bs-target="#thrModal">
      🎁 &nbsp;Klik untuk Klaim THR-mu!
    </button>
    <p class="mt-3 small text-mute">Hadiah spesial menantimu 👆</p>

  </div>
</section>

<!-- AMALAN CARDS -->
<section class="py-5 bg-n1 border-b-accent1">
  <div class="container">
    <div class="text-center mb-5">
      <span class="badge rounded-pill px-3 py-2 mb-3 fw-normal ls-2 bg-badge border border-accent-25 text-accent fs-075">PANDUAN IBADAH</span>
      <h2 class="fw-bolder mb-0 ff-cinzel fs-section">
        Amalan <span class="text-accent">Utama</span> Ramadan
      </h2>
    </div>

    <div class="row g-4">

      <div class="col-sm-6 col-lg-3">
        <div class="card h-100 rounded-4 border text-white overflow-hidden bg-card shadow-card border-accent-25 border-t-card card-hover">
          <div class="card-body p-4">
            <div class="icon-box rounded-3 d-flex align-items-center justify-content-center mb-3 bg-icon border border-accent-25">🌙</div>
            <h5 class="fw-bold mb-2 text-accent">Puasa</h5>
            <p class="mb-0 text-dim small lh-17">Menahan diri dari makan, minum, dan hal yang membatalkan dari fajar hingga terbenam matahari.</p>
          </div>
          <div class="card-footer border-0 bg-transparent pt-0 pb-3 px-4">
            <span class="badge rounded-pill bg-badge border border-accent-25 text-accent fs-07">Rukun Islam ke-4</span>
          </div>
        </div>
      </div>

      <div class="col-sm-6 col-lg-3">
        <div class="card h-100 rounded-4 border text-white overflow-hidden bg-card shadow-card border-accent-25 border-t-card card-hover">
          <div class="card-body p-4">
            <div class="icon-box rounded-3 d-flex align-items-center justify-content-center mb-3 bg-icon border border-accent-25">📖</div>
            <h5 class="fw-bold mb-2 text-accent">Tadarus Al‑Qur'an</h5>
            <p class="mb-0 text-dim small lh-17">Membaca dan merenungi firman Allah, target khatam minimal sekali selama Ramadan.</p>
          </div>
          <div class="card-footer border-0 bg-transparent pt-0 pb-3 px-4">
            <span class="badge rounded-pill bg-badge border border-accent-25 text-accent fs-07">Bulan Al‑Qur'an</span>
          </div>
        </div>
      </div>

      <div class="col-sm-6 col-lg-3">
        <div class="card h-100 rounded-4 border text-white overflow-hidden bg-card shadow-card border-accent-25 border-t-card card-hover">
          <div class="card-body p-4">
            <div class="icon-box rounded-3 d-flex align-items-center justify-content-center mb-3 bg-icon border border-accent-25">🤲</div>
            <h5 class="fw-bold mb-2 text-accent">Shalat Tarawih</h5>
            <p class="mb-0 text-dim small lh-17">Shalat sunnah malam khas Ramadan, dilaksanakan setelah Isya secara berjamaah.</p>
          </div>
          <div class="card-footer border-0 bg-transparent pt-0 pb-3 px-4">
            <span class="badge rounded-pill bg-badge border border-accent-25 text-accent fs-07">8 atau 20 Rakaat</span>
          </div>
        </div>
      </div>

      <div class="col-sm-6 col-lg-3">
        <div class="card h-100 rounded-4 border text-white overflow-hidden bg-card shadow-card border-accent-25 border-t-card card-hover">
          <div class="card-body p-4">
            <div class="icon-box rounded-3 d-flex align-items-center justify-content-center mb-3 bg-icon border border-accent-25">💝</div>
            <h5 class="fw-bold mb-2 text-accent">Sedekah & Zakat</h5>
            <p class="mb-0 text-dim small lh-17">Memperbanyak infak dan berzakat fitrah sebelum Idul Fitri sebagai penyempurna ibadah puasa.</p>
          </div>
          <div class="card-footer border-0 bg-transparent pt-0 pb-3 px-4">
            <span class="badge rounded-pill bg-badge border border-accent-25 text-accent fs-07">Wajib & Sunnah</span>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- DOA BUKA PUASA -->
<section class="py-5 bg-n2 border-b-accent1">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="rounded-4 p-4 p-md-5 text-center bg-doa border border-accent-50 shadow-doa">
          <span class="badge rounded-pill px-3 py-2 mb-4 d-inline-block fw-normal ls-2 bg-badge border border-accent-50 text-accent fs-075">DOA BUKA PUASA</span>
          <p class="fw-bold mb-3 ff-amiri text-gold fs-arabic lh-20 dir-rtl">
            اَللّهُمَّ لَكَ صُمْتُ وَبِكَ آمَنْتُ وَعَلَى رِزْقِكَ أَفْطَرْتُ
          </p>
          <div class="border-top border-bottom border-accent-25 py-3 mb-3">
            <p class="fst-italic mb-0 fw-semibold text-cream">
              "Allaahumma laka shumtu wa bika aamantu wa 'alaa rizqika afthartu"
            </p>
          </div>
          <p class="mb-0 small text-mute lh-18">
            Ya Allah, untuk‑Mu aku berpuasa, kepada‑Mu aku beriman,<br>dan dengan rezeki‑Mu aku berbuka.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- JADWAL IMSAKIYAH -->
<section class="py-5 bg-n3 border-b-accent1">
  <div class="container">
    <div class="text-center mb-5">
      <span class="badge rounded-pill px-3 py-2 mb-3 fw-normal ls-2 bg-badge border border-accent-25 text-accent fs-075">HARI INI</span>
      <h2 class="fw-bolder mb-0 ff-cinzel fs-section">
        Jadwal <span class="text-accent">Imsakiyah</span>
      </h2>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-7 col-lg-5">
        <div class="rounded-4 overflow-hidden border border-accent-25 shadow-table">
          <table class="table table-dark table-borderless align-middle mb-0 table-navy">
            <thead class="border-bottom border-accent-25">
              <tr>
                <th class="py-3 ps-4 fw-semibold text-uppercase text-start text-accent ls-2 fs-075">Waktu</th>
                <th class="py-3 pe-4 fw-semibold text-uppercase text-end   text-accent ls-2 fs-075">Jam</th>
              </tr>
            </thead>
            <tbody id="jadwal-body"></tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- KEUTAMAAN -->
<section class="py-5 bg-n1 border-b-accent1">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="fw-bolder ff-cinzel fs-section">
        <span class="text-accent">Keutamaan</span> Ramadan
      </h2>
    </div>
    <div class="row g-4 justify-content-center">

      <div class="col-md-4">
        <div class="rounded-4 p-4 p-md-5 h-100 text-center bg-card border border-accent-25 shadow-keutamaan card-hover">
          <div class="display-3 mb-3">🌟</div>
          <span class="badge rounded-pill px-3 py-2 mb-3 fw-semibold bg-badge border border-accent-25 text-accent fs-075">10 HARI PERTAMA</span>
          <h5 class="fw-bold mb-2 text-accent">Penuh Rahmat</h5>
          <p class="mb-0 small text-dim lh-17">Perbanyak ibadah dan doa memohon rahmat Allah SWT di sepuluh hari awal Ramadan.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="rounded-4 p-4 p-md-5 h-100 text-center bg-card border border-accent-25 shadow-keutamaan card-hover">
          <div class="display-3 mb-3">🛡️</div>
          <span class="badge rounded-pill px-3 py-2 mb-3 fw-semibold bg-badge border border-accent-25 text-accent fs-075">10 HARI KEDUA</span>
          <h5 class="fw-bold mb-2 text-accent">Penuh Ampunan</h5>
          <p class="mb-0 small text-dim lh-17">Mohon ampun atas segala dosa dan kesalahan kepada Allah Yang Maha Pengampun.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="rounded-4 p-4 p-md-5 h-100 text-center bg-card border border-accent-25 shadow-keutamaan card-hover">
          <div class="display-3 mb-3">🔥</div>
          <span class="badge rounded-pill px-3 py-2 mb-3 fw-semibold bg-badge border border-accent-25 text-accent fs-075">10 HARI KETIGA</span>
          <h5 class="fw-bold mb-2 text-accent">Bebas dari Neraka</h5>
          <p class="mb-0 small text-dim lh-17">Cari Lailatul Qadar — malam yang lebih baik dari seribu bulan di sepuluh malam terakhir.</p>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- FOOTER -->
<footer class="py-5 text-center bg-n3 border-top border-accent-25">
  <div class="container">
    <div class="display-5 mb-3">🌙</div>
    <p class="fw-bold mb-1 ff-cinzel text-accent ls-2">RAMADAN MUBARAK 1447 H</p>
    <p class="small mb-1 text-mute">Semoga semua amal ibadah kita diterima &nbsp;·&nbsp; Minal Aidin Wal Faizin</p>
    <p class="small mb-0 text-mute">© 2026 Caroline Carren | 2311102174</p>
  </div>
</footer>

<!-- THR MODAL -->
<div class="modal fade" id="thrModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 text-white overflow-hidden bg-modal border border-accent-50 shadow-modal">

      <div class="modal-bar w-100 bg-bar"></div>

      <div class="modal-header border-0 pb-0">
        <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body text-center px-4 py-3">
        <div class="display-1 mb-2">🎊</div>
        <p class="fw-semibold text-uppercase mb-1 text-mute ls-4 fs-075">Selamat!</p>

        <h1 class="fw-bolder my-2 ff-cinzel text-gold fs-thr glow-gold">
          Rp 500.000
        </h1>

        <h3 class="fw-bold mb-3 ff-amiri text-accent fs-16">
          🎁 Anda Mendapatkan THR! 🎁
        </h3>

        <p class="fst-italic mb-4 small text-dim lh-18">
          "Tunjangan Hari Raya telah menghampirimu —<br>nikmati momen bahagia bersama keluarga!"
        </p>

        <!-- Progress -->
        <div class="mb-4 text-start">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <small class="fw-semibold text-accent"><i class="bi bi-gift-fill me-1"></i>THR Diklaim</small>
            <small id="pct-label" class="text-accent">0%</small>
          </div>
          <div class="rounded-pill overflow-hidden bg-progress-track progress-h">
            <div id="thr-progress" class="h-100 rounded-pill bg-progress bar-reset w-0"></div>
          </div>
        </div>

        <!-- Badges -->
        <div class="d-flex justify-content-center gap-2 flex-wrap">
          <span class="badge rounded-pill px-3 py-2 bg-badge border border-accent-25 text-accent fs-075">
            <i class="bi bi-stars me-1"></i>Berkah Ramadan
          </span>
          <span class="badge rounded-pill px-3 py-2 bg-badge border border-accent-25 text-accent fs-075">
            <i class="bi bi-heart-fill me-1"></i>Minal Aidin
          </span>
          <span class="badge rounded-pill px-3 py-2 bg-badge border border-accent-25 text-accent fs-075">
            <i class="bi bi-gift me-1"></i>Wal Faizin
          </span>
        </div>
      </div>

      <div class="modal-footer border-0 justify-content-center pb-4 pt-2 gap-3">
        <button id="claimBtn" type="button"
                class="btn fw-bold rounded-pill px-5 py-2 fs-6 border-0 shadow-btn bg-btn-primary text-white btn-min">
          <i class="bi bi-bag-check-fill me-2"></i>Klaim Sekarang! 🎉
        </button>
        <button type="button" class="btn btn-outline-secondary rounded-pill px-4 py-2 small"
                data-bs-dismiss="modal">Nanti Saja</button>
      </div>

      <div class="modal-bar w-100 bg-bar"></div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
/* ─ Countdown ─ */
(function () {
  const target = new Date('2026-03-20T00:00:00');
  const pad = n => String(n).padStart(2, '0');
  function tick() {
    const d = Math.max(0, target - new Date());
    document.getElementById('cd-hari').textContent  = pad(Math.floor(d / 86400000));
    document.getElementById('cd-jam').textContent   = pad(Math.floor(d % 86400000 / 3600000));
    document.getElementById('cd-menit').textContent = pad(Math.floor(d % 3600000 / 60000));
    document.getElementById('cd-detik').textContent = pad(Math.floor(d % 60000 / 1000));
  }
  setInterval(tick, 1000); tick();
})();

/* ─ Jadwal ─ */
(function () {
  const rows = [
    ['Imsak',   '04:12'],
    ['Subuh',   '04:22'],
    ['Dzuhur',  '12:01'],
    ['Ashar',   '15:18'],
    ['Maghrib', '17:58'],
    ['Isya',    '19:10'],
  ];
  const tb = document.getElementById('jadwal-body');
  rows.forEach(([nama, jam]) => {
    const tr  = document.createElement('tr');
    const td1 = document.createElement('td');
    td1.className   = 'py-3 ps-4 text-white';
    td1.textContent = nama;
    const td2 = document.createElement('td');
    td2.className   = 'py-3 pe-4 fw-bold text-end text-accent';
    td2.textContent = jam;
    tr.append(td1, td2);
    tb.appendChild(tr);
  });
})();

/* ─ THR Modal ─ */
(function () {
  const modal    = document.getElementById('thrModal');
  const bar      = document.getElementById('thr-progress');
  const lbl      = document.getElementById('pct-label');
  const claimBtn = document.getElementById('claimBtn');
  let claimed    = false;

  function resetBar() {
    bar.classList.replace('bar-animate', 'bar-reset');
    bar.classList.replace('w-100', 'w-0');
    lbl.textContent = '0%';
  }

  function animateBar() {
    bar.classList.replace('bar-reset', 'bar-animate');
    bar.classList.replace('w-0', 'w-100');
    let v = 0;
    const iv = setInterval(() => {
      lbl.textContent = Math.min(100, v += 2) + '%';
      if (v >= 100) clearInterval(iv);
    }, 36);
  }

  modal.addEventListener('shown.bs.modal',  () => { resetBar(); setTimeout(animateBar, 300); });
  modal.addEventListener('hidden.bs.modal', () => { if (!claimed) resetBar(); });

  claimBtn.addEventListener('click', () => {
    if (claimed) return;
    claimed = true;
    claimBtn.innerHTML = '<i class="bi bi-check2-circle me-2"></i>THR Berhasil Diklaim! 🎉';
    claimBtn.classList.replace('bg-btn-primary', 'bg-btn-success');
    claimBtn.disabled = true;
    setTimeout(() => {
      bootstrap.Modal.getInstance(modal).hide();
      const openBtn = document.querySelector('[data-bs-target="#thrModal"]');
      openBtn.innerHTML = '<i class="bi bi-check2-circle me-2"></i>THR Sudah Diklaim ✅';
      openBtn.classList.replace('bg-btn-primary', 'bg-btn-success');
      openBtn.disabled = true;
    }, 2500);
  });
})();
</script>
</body>

</html>
```
### Output:
<img width="1888" height="906" alt="image" src="https://github.com/user-attachments/assets/e56593fb-1816-4557-b808-7245ae69b8a8" />
<img width="1878" height="901" alt="image" src="https://github.com/user-attachments/assets/2475a6bd-3ad1-4681-bc0b-b8c95533d59c" />
<img width="1900" height="908" alt="image" src="https://github.com/user-attachments/assets/31eb34ee-c13d-479e-9351-a70ab2a3b808" />
<img width="1868" height="901" alt="image" src="https://github.com/user-attachments/assets/b9b0ffeb-67f0-4d56-aa5d-d6ecbdce0240" />
<img width="1882" height="837" alt="image" src="https://github.com/user-attachments/assets/2251b95c-0013-4b77-bcc9-86d5a3762fb1" />
<img width="1887" height="905" alt="image" src="https://github.com/user-attachments/assets/40f3a683-d13d-40ee-9858-295665275d4f" />
<img width="1881" height="903" alt="image" src="https://github.com/user-attachments/assets/04f4ae29-c7de-4cea-a440-e671b0eedf6f" />
<img width="1900" height="900" alt="image" src="https://github.com/user-attachments/assets/3f52b8f4-35bc-4e4b-b8d6-f8d10b7fec8f" />
<img width="1898" height="899" alt="image" src="https://github.com/user-attachments/assets/00bea47c-ea6b-4a2c-b42a-301849b6fa21" />
<img width="1883" height="898" alt="image" src="https://github.com/user-attachments/assets/da064a85-5eeb-4bd0-9496-0449f35ea0cb" />

### Deskripsi Program : 
Program ini merupakan sebuah halaman web bertema Ramadan yang dibuat menggunakan HTML dan framework Bootstrap. Pada halaman ini, berbagai komponen Bootstrap digunakan untuk membangun tampilan antarmuka yang menarik dan responsif tanpa menggunakan native CSS secara berlebihan.

Halaman web ini menampilkan beberapa bagian utama, seperti navbar, hero section, informasi amalan Ramadan, doa buka puasa, serta jadwal imsakiyah. Layout halaman dibuat menggunakan Bootstrap Grid System, sedangkan tampilan elemen seperti card, table, badge, button, dan modal memanfaatkan komponen yang tersedia pada Bootstrap.

Selain itu, halaman ini juga memiliki fitur interaktif, yaitu sebuah button untuk klaim THR. Ketika button tersebut diklik, akan muncul modal Bootstrap yang menampilkan pesan “Selamat, Anda mendapatkan THR”. Fitur ini dibuat untuk memberikan interaksi kepada pengguna serta menunjukkan penggunaan komponen modal pada Bootstrap.

Dengan memanfaatkan Bootstrap, halaman web ini dapat tampil lebih rapi, responsif, dan interaktif tanpa perlu menambahkan banyak kode CSS secara manual.

