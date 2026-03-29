# Sistem Penilaian Mahasiswa

> Tugas Pertemuan 3 — Pemrograman Web PHP

---

## Deskripsi

**Sistem Penilaian Mahasiswa** adalah aplikasi web berbasis PHP yang digunakan untuk menghitung dan menampilkan nilai akhir mahasiswa secara otomatis. Sistem ini memproses data nilai tugas, UTS, dan UAS menggunakan pembobotan tertentu, lalu menentukan grade dan status kelulusan setiap mahasiswa.

---

## Fitur

- Menampilkan data mahasiswa dalam tabel yang rapi
- Menghitung nilai akhir berdasarkan bobot tugas, UTS, dan UAS
- Menentukan grade (A / B / C / D / E) secara otomatis
- Menampilkan status kelulusan (**Lulus** / **Tidak Lulus**)
- Menghitung rata-rata nilai seluruh kelas
- Menampilkan mahasiswa dengan nilai tertinggi

---

## Formula Penilaian

| Komponen | Bobot |
|----------|-------|
| Nilai Tugas | 30% |
| Nilai UTS   | 35% |
| Nilai UAS   | 35% |

**Rumus Nilai Akhir:**
```
Nilai Akhir = (Tugas × 0.30) + (UTS × 0.35) + (UAS × 0.35)
```

**Ketentuan Grade:**

| Nilai Akhir | Grade |
|-------------|-------|
| ≥ 85        | A     |
| ≥ 75        | B     |
| ≥ 65        | C     |
| ≥ 55        | D     |
| < 55        | E     |

**Ketentuan Kelulusan:** Nilai akhir ≥ 60 → **Lulus**

---

## Teknologi yang Digunakan

- **PHP** — logika pemrosesan data (array, fungsi, perulangan, percabangan)
- **HTML5** — struktur halaman
- **CSS3** — tampilan dan styling tabel

---

## Cara Menjalankan

> Menggunakan **VS Code** dengan ekstensi **PHP Server**
 
1. **Clone** repository ini:
   ```bash
   git clone https://github.com/carolinecarren/php.git
   ```
 
2. Buka folder project di **VS Code**
 
3. Install ekstensi **PHP Server** *(by brapifra)* melalui Extensions (`Ctrl+Shift+X`)
 
4. Pastikan **PHP sudah terinstall** di komputer, cek lewat terminal:
   ```bash
   php -v
   ```
 
5. Buka file `index.php`, lalu **klik kanan** di editor dan pilih:
   ```
   PHP Server: Serve Project
   ```
 
6. Browser akan otomatis terbuka, atau akses manual di:
   ```
   http://localhost:3000/index.php
   ```
 
---

## Struktur File

```
PHP/
├── index.php
├── laporan modul php.md
└── README.md
```

---

## Identitas Pembuat

| Field | Detail |
|-------|--------|
| **Nama** | Caroline Carren |
| **NIM**  | 2311102174 |
