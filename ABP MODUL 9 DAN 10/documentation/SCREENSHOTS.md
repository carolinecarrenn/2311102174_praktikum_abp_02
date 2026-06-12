# Dokumentasi Screenshot - Flutter To-Do List FCM

## 📸 Screenshot 1: Tampilan Daftar Tugas (Empty State)

**Deskripsi:**
- Aplikasi menampilkan state kosong saat pertama kali dibuka
- Terdapat icon besar berwarna abu-abu (task_alt) sebagai placeholder
- Teks "Belum ada tugas" dengan font bold
- Teks instruksi "Tekan tombol + untuk menambah tugas"
- FloatingActionButton (+) berwarna ungu di pojok kanan bawah

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│                             │
│                             │
│          📋                 │
│      (icon besar)           │
│                             │
│    Belum ada tugas          │
│                             │
│  Tekan tombol + untuk      │
│  menambah tugas            │
│                             │
│                             │
│                             │
│                        ⊕   │
└─────────────────────────────┘
```

---

## 📸 Screenshot 2: Proses Penambahan Tugas

**Deskripsi:**
- User menekan FloatingActionButton (+)
- Muncul AlertDialog dengan TextField untuk input
- Header dialog: icon + "Tambah Tugas"
- TextField dengan placeholder "Masukkan nama tugas..."
- Tombol "Batal" dan "Tambah"

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│                             │
│                             │
│         ┌─────────────────┐ │
│         │  ⊕ Tambah Tugas │ │
│         ├─────────────────┤ │
│         │                 │ │
│         │ [Masukkan nama  │ │
│         │  tugas...     ] │ │
│         │                 │ │
│         │ [Batal] [Tambah]│ │
│         └─────────────────┘ │
│                             │
│                             │
│                             │
│                        ⊕   │
└─────────────────────────────┘
```

---

## 📸 Screenshot 3: Daftar Tugas dengan Data

**Deskripsi:**
- Setelah menambah tugas, list akan muncul di layar
- Header menampilkan "Total: X tugas" dengan jumlah tugas
- Setiap task ditampilkan dalam Card dengan:
  - CircleAvatar berisi nomor urut
  - Judul tugas
  - Timestamp (e.g., "Baru saja", "5 menit lalu", "Kemarin")
  - Tombol delete (icon trash) di sebelah kanan
- Swipe dari kanan ke kiri也可以删除任务

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│  📋 Total: 3 tugas         │
├─────────────────────────────┤
│  ┌─────────────────────┐   │
│  │ (1) Beli bahan      │   │
│  │     makan           │   │
│  │     5 menit lalu  🗑│   │
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ (2) Kerjakan PR     │   │
│  │     1 jam lalu     🗑│   │
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ (3) Meeting project  │   │
│  │     Kemarin        🗑│   │
│  └─────────────────────┘   │
│                             │
│  [🗑 Hapus Semua Tugas]   │
│                        ⊕   │
└─────────────────────────────┘
```

---

## 📸 Screenshot 4: Konfirmasi Hapus Semua

**Deskripsi:**
- User menekan tombol "Hapus Semua Tugas" di bottom
- Muncul AlertDialog konfirmasi
- Icon warning berwarna merah
- Teks: "Apakah Anda yakin ingin menghapus semua tugas? Tindakan ini tidak dapat dibatalkan."
- Tombol "Batal" dan "Hapus Semua"

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│  📋 Total: 3 tugas         │
├─────────────────────────────┤
│  ┌─────────────────────┐   │
│  │ (1) Beli bahan      │   │
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ (2) Kerjakan PR      │   │
│  └─────────────────────┘   │
│                             │
│      ┌─────────────────┐   │
│      │ ⚠ Hapus Semua?  │   │
│      ├─────────────────┤   │
│      │                  │   │
│      │ Apakah Anda      │   │
│      │ yakin ingin      │   │
│      │ menghapus semua  │   │
│      │ tugas?           │   │
│      │                  │   │
│      │ [Batal] [Hapus]  │   │
│      └─────────────────┘   │
│                             │
│  [🗑 Hapus Semua Tugas]   │
│                        ⊕   │
└─────────────────────────────┘
```

---

## 📸 Screenshot 5: Notifikasi FCM Berhasil Diterima

**Deskripsi:**
- Saat aplikasi menerima push notification dari FCM
- Snackbar muncul di bagian bawah layar
- Menampilkan icon lonceng 🔔
- Judul notifikasi dalam bold: "🔔 [Judul dari Firebase]"
- Body notifikasi di bawahnya
- Background Snackbar berwarna ungu (deepPurple)
- Duration: 5 detik

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│                             │
│  ┌─────────────────────┐   │
│  │ (1) Beli bahan      │   │
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ (2) Kerjakan PR      │   │
│  └─────────────────────┘   │
│                             │
│  [🗑 Hapus Semua Tugas]   │
│                        ⊕   │
├─────────────────────────────┤
│ ┌─────────────────────────┐│
│ │ 🔔 Notifikasi Baru!     ││
│ │   Anda punya tugas      ││
│ │   yang perlu dikerjakan ││
│ └─────────────────────────┘│
└─────────────────────────────┘
```

---

## 📸 Screenshot 6: Snackbar Konfirmasi Aksi

**Deskripsi:**
- Setelah menambah tugas baru:
  - Snackbar hijau dengan icon check_circle
  - Teks: "Tugas "[nama]" ditambahkan!"
- Setelah menghapus tugas:
  - Snackbar oranye dengan icon delete
  - Teks: "Tugas "[nama]" dihapus"
  - Tombol "BATAL" untuk undo

**Expected Result (Add Task):**
```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │
├─────────────────────────────┤
│                             │
│  ┌─────────────────────┐   │
│  │ (1) Beli bahan      │   │
│  └─────────────────────┘   │
│                             │
│  [🗑 Hapus Semua Tugas]   │
│                        ⊕   │
├─────────────────────────────┤
│ ┌─────────────────────────┐│
│ │ ✓ Tugas "Beli bahan     ││
│ │   makan" ditambahkan!   ││
│ └─────────────────────────┘│
└─────────────────────────────┘
```

---

## 📸 Screenshot 7: FCM Info Button

**Deskripsi:**
- Saat user mengetuk icon lonceng (🔔) di AppBar
- Muncul Snackbar biru
- Teks: "FCM aktif! Kirim notifikasi dari Firebase Console."

**Expected Result:**
```
┌─────────────────────────────┐
│  ☑ To-Do List      [🔔]  │  <- Diketuk
├─────────────────────────────┤
│                             │
│  ┌─────────────────────┐   │
│  │ (1) Beli bahan      │   │
│  └─────────────────────┘   │
│                             │
│  [🗑 Hapus Semua Tugas]   │
│                        ⊕   │
├─────────────────────────────┤
│ ┌─────────────────────────┐│
│ │ ℹ FCM aktif! Kirim      ││
│ │   notifikasi dari        ││
│ │   Firebase Console.      ││
│ └─────────────────────────┘│
└─────────────────────────────┘
```

---

## 📝 Catatan Pengujian

Untuk menghasilkan screenshot di atas, ikuti langkah-langkah berikut:

1. **Screenshot 1**: Buka aplikasi fresh install atau setelah clear data
2. **Screenshot 2**: Tekan tombol (+) FAB
3. **Screenshot 3**: Tambahkan 3 tugas melalui dialog
4. **Screenshot 4**: Tekan tombol "Hapus Semua Tugas"
5. **Screenshot 5**: Kirim notifikasi dari Firebase Console ke topic "all"
6. **Screenshot 6**: Akan muncul otomatis setelah aksi
7. **Screenshot 7**: Tekan icon 🔔 di AppBar