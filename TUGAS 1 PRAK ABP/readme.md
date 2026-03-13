# 🌙 Ramadan Mubarak 1447 H
 
> Halaman web bertema Ramadan Mubarak yang dibangun menggunakan **Bootstrap 5** dengan fitur modal THR interaktif.
 
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3.3-7952B3?style=flat-square&logo=bootstrap&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
 
---
 
## 📋 Deskripsi
 
Tugas praktikum Pemrograman Web — membuat halaman Ramadan menggunakan Bootstrap 5 (sebisa mungkin tanpa native CSS) dilengkapi dengan modal interaktif "Selamat Anda Mendapatkan THR".
 
---
 
## ✨ Fitur
 
| Fitur | Keterangan |
|-------|-----------|
| 🕐 Countdown Timer | Menghitung mundur waktu menuju Idul Fitri secara real-time |
| 🎁 Modal THR | Popup interaktif dengan animasi progress bar dan tombol klaim |
| 📖 Doa Buka Puasa | Teks Arab, transliterasi, dan terjemahan lengkap |
| 🕌 Jadwal Imsakiyah | Tabel waktu shalat harian yang dirender dinamis via JS |
| 📱 Responsive | Layout menyesuaikan semua ukuran layar (mobile-first) |
| ✨ Hover Effects | Card animasi naik saat di-hover |
 
---
 
## 🗂️ Struktur Halaman
 
```
📄 index.html
├── 🔝 Navbar          → sticky top, judul + badge
├── 🌙 Hero Section    → teks Arab, countdown, tombol THR
├── 🃏 Amalan Cards    → 4 card Bootstrap (Puasa, Tadarus, Tarawih, Sedekah)
├── 🤲 Doa Buka Puasa  → kotak doa dengan border hijau
├── 📅 Jadwal Imsakiyah → tabel Bootstrap
├── ⭐ Keutamaan       → 3 card (10 hari pertama/kedua/ketiga)
├── 🦶 Footer          → kredit & ucapan
└── 🎊 Modal THR       → popup interaktif
```
 
---
 
## 🧩 Komponen Bootstrap yang Digunakan
 
```
Navbar       → .navbar .sticky-top .navbar-dark
Badge        → .badge .rounded-pill
Card         → .card .card-body .card-footer .h-100
Table        → .table .table-dark .table-borderless
Modal        → .modal .modal-dialog .modal-content .modal-header
Button       → .btn .btn-lg .rounded-pill
Progress     → .progress .progress-bar
Grid         → .container .row .col-sm-6 .col-lg-3 .col-md-4
Spacing      → .p-4 .mb-5 .px-3 .py-3 .gap-3
Typography   → .fw-bold .fw-bolder .text-uppercase .display-5
Flexbox      → .d-flex .align-items-center .justify-content-center
Overflow     → .overflow-hidden .rounded-4
Shadow       → .shadow .shadow-lg
Opacity      → .opacity-50 .border-opacity-25
```
 
---
 
## 🎨 CSS Custom
 
Bootstrap digunakan semaksimal mungkin. CSS custom **hanya** dipakai untuk hal yang tidak bisa dilakukan Bootstrap:
 
| Kebutuhan | Alasan |
|-----------|--------|
| Warna navy custom | Bootstrap tidak punya palet `#060e1f`, `#0a1628`, dst |
| Gradient background | Bootstrap tidak punya utility `linear-gradient` / `radial-gradient` |
| Font Cinzel & Amiri | Font custom dari Google Fonts, tidak tersedia di Bootstrap |
| `text-shadow` / `filter` | Bootstrap tidak punya utility glow/shadow teks |
| `clamp()` font size | Bootstrap tidak punya responsive font size via clamp |
| Class animasi progress bar | Untuk toggle transition via `classList` tanpa inline style |
 
> ✅ **Zero inline `style="..."` di HTML**
> ✅ **Zero `.style.` manipulasi di JavaScript**
> ✅ Semua visual dikontrol via **class**, bukan inline
 
---
 
## ⚙️ JavaScript
 
### Countdown Timer
```js
const target = new Date('2026-03-20T00:00:00');
// Menghitung selisih waktu setiap 1 detik
setInterval(tick, 1000);
```
 
### Jadwal Imsakiyah (DOM Manipulation)
```js
// Data di-render dinamis ke <tbody> tabel
data.forEach(([nama, jam]) => {
  const tr = document.createElement('tr');
  // ...append td dengan className Bootstrap
  tb.appendChild(tr);
});
```
 
### Modal THR — Alur Interaksi
```
1. Klik tombol              → Bootstrap Modal terbuka
2. shown.bs.modal           → progress bar reset ke 0%
3. setTimeout 300ms         → classList animasi diaktifkan → bar meluncur ke 100%
4. setInterval              → label persentase naik 0% → 100%
5. Klik "Klaim Sekarang"    → classList.replace() ganti warna tombol ke hijau
6. 2.5 detik kemudian       → modal tutup, tombol hero berubah jadi "Sudah Diklaim"
7. hidden.bs.modal          → jika belum klaim, bar di-reset
```
 
---
 
## 🚀 Cara Menjalankan
 
1. Clone atau download repository ini
2. Buka file `index.html` di browser
3. Tidak perlu instalasi apapun — semua library dimuat via CDN
---
 
## 📦 CDN yang Digunakan
 
```html
<!-- Bootstrap 5.3.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
 
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
 
<!-- Google Fonts: Cinzel + Amiri + Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700;900&family=Amiri:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet"/>
 
<!-- Bootstrap 5.3.3 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
```
 
---
