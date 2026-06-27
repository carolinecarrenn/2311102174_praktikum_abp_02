# 📱 Praktikum Modul 6-9: Notifikasi & API Perangkat Keras

## 📋 Deskripsi
Aplikasi Flutter sederhana untuk praktikum Notifikasi & API Perangkat Keras yang menampilkan fitur pengambilan foto dan notifikasi lokal.

## ✨ Fitur

### 1. 📷 Ambil Foto
- **Tombol Kamera**: Membuka kamera langsung untuk mengambil foto
- **Tombol Galeri**: Memilih foto dari galeri perangkat
- **Preview Foto**: Foto yang diambil/dipilih ditampilkan di halaman yang sama
- **Switch Kamera**: Tombol untuk mengganti antara kamera depan dan belakang

### 2. 🔔 Notifikasi
- Notifikasi lokal otomatis setelah foto berhasil diambil atau dipilih
- Tombol test notifikasi di AppBar
- Pesan notifikasi dengan ikon dan deskripsi

## 🛠️ Teknologi yang Digunakan

| Package | Fungsi |
|---------|--------|
| `camera` | API kamera untuk mengambil foto langsung |
| `image_picker` | Memilih foto dari galeri |
| `flutter_local_notifications` | Menampilkan notifikasi lokal |
| `permission_handler` | Mengelola izin perangkat |

## 📁 Struktur Proyek

```
modul_6_9/
├── lib/
│   └── main.dart          # Kode utama aplikasi
├── android/
│   └── app/src/main/
│       └── AndroidManifest.xml  # Konfigurasi izin Android
├── ios/
│   └── Runner/
│       └── Info.plist     # Konfigurasi izin iOS
└── pubspec.yaml           # Daftar dependencies
```

## 🚀 Cara Menjalankan

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Jalankan Aplikasi
```bash
# Untuk Android
flutter run

# Untuk iOS (membutuhkan simulator/mac)
flutter run -d <device_id>
```

## 📝 Izin yang Dibutuhkan

### Android (AndroidManifest.xml)
- android.permission.CAMERA - Akses kamera
- android.permission.READ_MEDIA_IMAGES - Membaca gambar
- android.permission.POST_NOTIFICATIONS - Menampilkan notifikasi

### iOS (Info.plist)
- NSCameraUsageDescription - Izin kamera
- NSPhotoLibraryUsageDescription - Izin galeri foto
- NSPhotoLibraryAddUsageDescription - Izin menyimpan foto

## 👨‍💻 Informasi Tambahan

- Platform: Flutter (Android & iOS)
- Bahasa: Dart
- Min SDK: Android 21 (Lollipop)
- Versi Flutter: 3.x+

## 📄 Lisensi
Proyek ini dibuat untuk keperluan praktikum ABP 
Caroline Carren (2311192174)
