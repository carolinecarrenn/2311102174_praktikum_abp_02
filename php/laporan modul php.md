<h2 align="center"><strong>LAPORAN PRAKTIKUM</strong></h2>
<h2 align="center"><strong>APLIKASI BERBASIS PLATFORM</strong></h2>

<br>

<h2 align="center"><strong> MODUL IX </strong></h2>
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

<h2 align="center"><strong>LAPORAN PRAKTIKUM</strong></h2>
<h2 align="center"><strong>PEMROGRAMAN WEB PHP</strong></h2>

<br>

<h2 align="center"><strong>MODUL / PERTEMUAN 3</strong></h2>
<h2 align="center"><strong>SISTEM PENILAIAN MAHASISWA</strong></h2> 

<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/741cb565-774a-4298-b1fb-22ebf35822f1" alt="Logo" width="200"/>
</p>

<br>

<p align="center">
  <strong>Disusun Oleh:</strong><br>
  Caroline Carren A.R / 2311102174<br>
  S1 IF 11 05
</p>

<br>

<p align="center">
  <strong>Dosen Pengampu:</strong><br>
  Arif Amrulloh,S.Kom.,M.Kom.
</p>

<br>

<p align="center">
  <strong>PROGRAM STUDI S1 TEKNIK INFORMATIKA</strong><br>
  <strong>FAKULTAS INFORMATIKA</strong><br>
  <strong>TELKOM UNIVERSITY PURWOKERTO</strong><br>
  <strong>2024</strong>
</p>

------

## Daftar Isi
1. [Tujuan Praktikum](#tujuan-praktikum)
2. [Dasar Teori](#dasar-teori)
3. [Program](#program)
4. [Output Program](#output-program)
5. [Deskripsi Program](#deskripsi-program)
6. [Algoritma Program](#algoritma-program)
7. [Cara Kerja Program](#cara-kerja-program)
8. [Kesimpulan](#kesimpulan)
9. [Daftar Pustaka](#daftar-pustaka)

## Tujuan Praktikum
1. Memahami penggunaan PHP dalam pembuatan program berbasis web.
2. Menerapkan konsep array asosiatif dalam penyimpanan data.
3. Menerapkan function untuk mempermudah proses perhitungan.
4. Menggunakan percabangan untuk menentukan grade dan status kelulusan.
5. Menggunakan perulangan untuk memproses data mahasiswa.
6. Menampilkan hasil program dalam bentuk tabel yang rapi dan mudah dipahami.

## Dasar Teori
PHP adalah bahasa pemrograman server-side yang digunakan untuk membangun website dinamis. PHP mampu mengolah data, menjalankan logika program, dan menampilkan hasilnya melalui halaman web.

Dalam praktikum ini, program dibuat untuk mengolah data nilai mahasiswa. Beberapa konsep dasar yang digunakan yaitu array asosiatif, function, operator aritmatika, percabangan, perulangan, HTML, dan CSS.

- **Array Asosiatif** digunakan untuk menyimpan data mahasiswa seperti nama, NIM, nilai tugas, nilai UTS, dan nilai UAS.
- **Function** digunakan agar program lebih terstruktur, misalnya untuk menghitung nilai akhir, menentukan grade, dan menentukan status kelulusan.
- **Percabangan** digunakan untuk menentukan grade berdasarkan nilai akhir.
- **Perulangan** digunakan untuk memproses seluruh data mahasiswa secara berulang.
- **HTML dan CSS** digunakan untuk menampilkan data dalam bentuk tabel dan mempercantik tampilan halaman web.

## Program

### Source Code :
```php
<?php
// ============================================================
// Sistem Penilaian Mahasiswa
// Tugas Pertemuan 3 - Pemrograman Web PHP
// Dibuat oleh : Caroline Carren
// NIM         : 2311102174
// ============================================================

// Array asosiatif untuk menyimpan data mahasiswa
// Setiap mahasiswa memiliki nama, nim, nilai tugas, uts, dan uas
$mahasiswa = [
    [
        "nama"        => "Kim Jiwoo",
        "nim"         => "2024110001",
        "nilai_tugas" => 85,
        "nilai_uts"   => 78,
        "nilai_uas"   => 82,
    ],
    [
        "nama"        => "Park Seonjun",
        "nim"         => "2024110002",
        "nilai_tugas" => 70,
        "nilai_uts"   => 65,
        "nilai_uas"   => 60,
    ],
    [
        "nama"        => "Choi Yuna",
        "nim"         => "2024110003",
        "nilai_tugas" => 92,
        "nilai_uts"   => 88,
        "nilai_uas"   => 95,
    ],
    [
        "nama"        => "Lee Junho",
        "nim"         => "2024110004",
        "nilai_tugas" => 55,
        "nilai_uts"   => 50,
        "nilai_uas"   => 48,
    ],
    [
        "nama"        => "Jung Haerin",
        "nim"         => "2024110005",
        "nilai_tugas" => 78,
        "nilai_uts"   => 80,
        "nilai_uas"   => 75,
    ],
    [
        "nama"        => "Shin Minso",
        "nim"         => "2024110006",
        "nilai_tugas" => 88,
        "nilai_uts"   => 82,
        "nilai_uas"   => 90,
    ],
    [
        "nama"        => "Han Donghyun",
        "nim"         => "2024110007",
        "nilai_tugas" => 60,
        "nilai_uts"   => 55,
        "nilai_uas"   => 58,
    ],
    [
        "nama"        => "Yoon Seulgi",
        "nim"         => "2024110008",
        "nilai_tugas" => 76,
        "nilai_uts"   => 74,
        "nilai_uas"   => 80,
    ],
    [
        "nama"        => "Oh Hyunjae",
        "nim"         => "2024110009",
        "nilai_tugas" => 45,
        "nilai_uts"   => 52,
        "nilai_uas"   => 40,
    ],
];

// Function untuk menghitung nilai akhir
// Bobot penilaian:
// Tugas = 30%
// UTS   = 35%
// UAS   = 35%
function hitungNilaiAkhir($tugas, $uts, $uas) {
    // Operator aritmatika digunakan untuk menghitung total nilai akhir
    return round(($tugas * 0.30) + ($uts * 0.35) + ($uas * 0.35), 2);
}

// Function untuk menentukan grade berdasarkan nilai akhir
function tentukanGrade($nilai) {
    // Percabangan if/elseif/else untuk menentukan grade
    if ($nilai >= 85)       return "A";
    elseif ($nilai >= 75)   return "B";
    elseif ($nilai >= 65)   return "C";
    elseif ($nilai >= 55)   return "D";
    else                    return "E";
}

// Function untuk menentukan status kelulusan
function tentukanStatus($nilai) {
    // Operator ternary dipakai untuk mengecek lulus atau tidak lulus
    return ($nilai >= 60) ? "Lulus" : "Tidak Lulus";
}

// Variabel untuk menghitung total nilai seluruh mahasiswa
$total_nilai     = 0;

// Variabel untuk menyimpan nilai tertinggi
$nilai_tertinggi = 0;

// Variabel untuk menyimpan nama mahasiswa dengan nilai tertinggi
$nama_tertinggi  = "";

// Perulangan foreach untuk memproses seluruh data mahasiswa
foreach ($mahasiswa as &$mhs) {

    // Menghitung nilai akhir setiap mahasiswa
    $mhs["nilai_akhir"] = hitungNilaiAkhir(
        $mhs["nilai_tugas"],
        $mhs["nilai_uts"],
        $mhs["nilai_uas"]
    );

    // Menentukan grade mahasiswa
    $mhs["grade"]  = tentukanGrade($mhs["nilai_akhir"]);

    // Menentukan status kelulusan mahasiswa
    $mhs["status"] = tentukanStatus($mhs["nilai_akhir"]);

    // Menjumlahkan seluruh nilai akhir untuk menghitung rata-rata kelas
    $total_nilai += $mhs["nilai_akhir"];

    // Mencari nilai tertinggi dan nama mahasiswa yang mendapat nilai tertinggi
    if ($mhs["nilai_akhir"] > $nilai_tertinggi) {
        $nilai_tertinggi = $mhs["nilai_akhir"];
        $nama_tertinggi  = $mhs["nama"];
    }
}

// Menghapus referensi variabel foreach
unset($mhs);

// Menghitung rata-rata kelas
$rata_rata = round($total_nilai / count($mahasiswa), 2);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Sistem Penilaian Mahasiswa</title>

    <style>
        /* Mengatur tampilan dasar halaman */
        body {
            font-family: Arial, sans-serif;
            background: #fdf6f9;
            margin: 0;
            padding: 30px;
            color: #5c5470;
        }

        /* Kotak utama pembungkus isi halaman */
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fffafd;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(188, 170, 164, 0.18);
            padding: 30px;
            border: 1px solid #f3dfe8;
        }

        /* Judul utama */
        h2 {
            text-align: center;
            color: #8e7dbe;
            margin-bottom: 4px;
        }

        /* Subjudul */
        .subtitle {
            text-align: center;
            color: #9f90b0;
            font-size: 13px;
            margin-bottom: 24px;
        }

        /* Tabel data mahasiswa */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            overflow: hidden;
            border-radius: 12px;
        }

        /* Bagian header tabel */
        thead th {
            background-color: #cdb4db;
            color: #4a3f55;
            padding: 11px 14px;
            text-align: center;
        }

        /* Kolom nama dibuat rata kiri */
        thead th:nth-child(2) { 
            text-align: left; 
        }

        /* Isi tabel */
        tbody td {
            padding: 10px 14px;
            border-bottom: 1px solid #f3e8ef;
            text-align: center;
            background: #fff;
        }

        /* Isi kolom nama rata kiri */
        tbody td:nth-child(2) { 
            text-align: left; 
        }

        /* Memberi warna selang-seling pada baris tabel */
        tbody tr:nth-child(even) td {
            background-color: #fef6fb;
        }

        /* Efek hover saat kursor diarahkan ke baris */
        tbody tr:hover td { 
            background-color: #f9eef7; 
        }

        /* Style untuk grade */
        .grade {
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
        }

        /* Warna grade berdasarkan nilai */
        .g-A { background: #dcedc8; color: #5f7a46; }
        .g-B { background: #cde7f0; color: #4e7485; }
        .g-C { background: #fff1ba; color: #8a6d3b; }
        .g-D { background: #ffd6c0; color: #9a5a3c; }
        .g-E { background: #f8c8d8; color: #8b4a60; }

        /* Style untuk status lulus / tidak lulus */
        .status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 14px;
            font-size: 12px;
            font-weight: bold;
        }

        /* Warna status lulus */
        .lulus {
            background: #d8f3dc;
            color: #52796f;
        }

        /* Warna status tidak lulus */
        .tdk-lulus {
            background: #f8d7e6;
            color: #9d4f6c;
        }

        /* Kotak ringkasan nilai */
        .summary {
            margin-top: 20px;
            background: #fdf1f7;
            border: 1px solid #f3d7e6;
            border-radius: 12px;
            padding: 14px 18px;
            font-size: 14px;
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
        }

        /* Style teks penting pada ringkasan */
        .summary div span {
            font-weight: bold;
            color: #7b6d9c;
        }

        /* Footer identitas pembuat */
        .footer {
            margin-top: 24px;
            padding-top: 14px;
            border-top: 1px solid #f3dfe8;
            text-align: center;
            font-size: 12px;
            color: #a08fb0;
        }

        .footer strong {
            color: #8e7dbe;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Judul halaman -->
    <h2>Sistem Penilaian Mahasiswa</h2>

    <!-- Subjudul / informasi mata kuliah -->
    <div class="subtitle">Mata Kuliah: Pemrograman Web &nbsp;|&nbsp; Semester Genap 2024/2025</div>

    <!-- Tabel untuk menampilkan data mahasiswa -->
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>NIM</th>
                <th>Nilai Tugas</th>
                <th>Nilai UTS</th>
                <th>Nilai UAS</th>
                <th>Nilai Akhir</th>
                <th>Grade</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <!-- Perulangan untuk menampilkan semua data mahasiswa ke dalam tabel -->
            <?php foreach ($mahasiswa as $i => $mhs): ?>
            <tr>
                <!-- Nomor urut -->
                <td><?= $i + 1 ?></td>

                <!-- Nama mahasiswa -->
                <td><?= htmlspecialchars($mhs["nama"]) ?></td>

                <!-- NIM mahasiswa -->
                <td><?= $mhs["nim"] ?></td>

                <!-- Nilai tugas -->
                <td><?= $mhs["nilai_tugas"] ?></td>

                <!-- Nilai UTS -->
                <td><?= $mhs["nilai_uts"] ?></td>

                <!-- Nilai UAS -->
                <td><?= $mhs["nilai_uas"] ?></td>

                <!-- Nilai akhir -->
                <td><strong><?= $mhs["nilai_akhir"] ?></strong></td>

                <!-- Menampilkan grade dengan class sesuai hasil grade -->
                <td>
                    <span class="grade g-<?= $mhs["grade"] ?>">
                        <?= $mhs["grade"] ?>
                    </span>
                </td>

                <!-- Menampilkan status lulus atau tidak lulus -->
                <td>
                    <?php if ($mhs["status"] === "Lulus"): ?>
                        <span class="status lulus">Lulus</span>
                    <?php else: ?>
                        <span class="status tdk-lulus">Tidak Lulus</span>
                    <?php endif; ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Ringkasan nilai rata-rata kelas dan nilai tertinggi -->
    <div class="summary">
        <div>Rata-rata Kelas: <span><?= $rata_rata ?></span></div>
        <div>Nilai Tertinggi: <span><?= $nilai_tertinggi ?></span> (<?= htmlspecialchars($nama_tertinggi) ?>)</div>
    </div>

    <!-- Footer identitas pembuat -->
    <div class="footer">
        Dibuat oleh: <strong>Caroline Carren</strong> &nbsp;|&nbsp; NIM: <strong>2311102174</strong> &nbsp;|&nbsp; Tugas Pertemuan 3 — Pemrograman Web PHP
    </div>

</div>
</body>
</html>
```

## Output Program

Program akan menampilkan data mahasiswa dalam bentuk tabel yang berisi:

- Nomor
- Nama
- NIM
- Nilai Tugas
- Nilai UTS
- Nilai UAS
- Nilai Akhir
- Grade
- Status Kelulusan

Selain itu, program juga menampilkan:

- Rata-rata kelas
- Nilai tertinggi
- Nama mahasiswa dengan nilai tertinggi

### Full code Screenshot :
Tempel screenshot full source code di sini.

### Screenshot Output :
Tempel screenshot hasil output program di sini.

## Deskripsi Program

Program ini merupakan sistem penilaian mahasiswa sederhana berbasis PHP. Program digunakan untuk mengolah data beberapa mahasiswa yang terdiri dari nama, NIM, nilai tugas, nilai UTS, dan nilai UAS.

Setelah data dimasukkan, program akan menghitung nilai akhir setiap mahasiswa berdasarkan bobot yang telah ditentukan. Selanjutnya, program menentukan grade dan status kelulusan masing-masing mahasiswa. Hasil pengolahan data tersebut kemudian ditampilkan dalam bentuk tabel yang rapi pada halaman web.

## Algoritma Program

1. Mulai.
2. Menyimpan data mahasiswa ke dalam array asosiatif.
3. Membuat function untuk menghitung nilai akhir.
4. Membuat function untuk menentukan grade.
5. Membuat function untuk menentukan status kelulusan.
6. Menggunakan perulangan untuk memproses seluruh data mahasiswa.
7. Menghitung total nilai seluruh mahasiswa.
8. Menentukan nilai tertinggi dan nama mahasiswa terkait.
9. Menghitung rata-rata kelas.
10. Menampilkan seluruh data ke dalam tabel HTML.
11. Selesai.

## Cara Kerja Program

Program dimulai dengan mendeklarasikan data mahasiswa ke dalam array asosiatif. Setiap data mahasiswa berisi nama, NIM, nilai tugas, nilai UTS, dan nilai UAS.

Setelah itu, program memproses data menggunakan function yang telah dibuat. Function pertama digunakan untuk menghitung nilai akhir berdasarkan bobot nilai tugas, UTS, dan UAS. Function berikutnya digunakan untuk menentukan grade berdasarkan hasil nilai akhir. Kemudian, function lain digunakan untuk menentukan status kelulusan mahasiswa.

Semua data mahasiswa diproses menggunakan perulangan. Dalam proses tersebut, program juga menghitung rata-rata kelas dan mencari nilai tertinggi. Setelah seluruh data selesai diproses, hasilnya ditampilkan dalam bentuk tabel pada halaman web.

## Kesimpulan

Berdasarkan praktikum yang telah dilakukan, dapat disimpulkan bahwa PHP dapat digunakan untuk membuat sistem pengolahan data mahasiswa dengan baik. Program ini menerapkan konsep-konsep dasar pemrograman seperti array, function, operator aritmatika, percabangan, perulangan, serta HTML dan CSS.

Dengan adanya program ini, pengolahan nilai mahasiswa menjadi lebih cepat, rapi, dan mudah dipahami.

## Daftar Pustaka

1. Sidik, Betha. *Pemrograman Web dengan PHP*. Bandung: Informatika.
2. Dokumentasi Resmi PHP. *PHP Manual*.
3. Materi Praktikum Pemrograman Web PHP.