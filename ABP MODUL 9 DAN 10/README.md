# Flutter To-Do List dengan Provider & Firebase Cloud Messaging

## 📱 Deskripsi Aplikasi

Aplikasi To-Do List sederhana yang dibangun dengan Flutter menggunakan:
- **Provider** untuk state management
- **Firebase Cloud Messaging (FCM)** untuk push notifications

## 📁 Struktur Proyek

```
flutter_todolist_fcm/
├── lib/
│   ├── main.dart                    # Entry point aplikasi
│   ├── models/
│   │   └── task.dart                # Model data Task
│   ├── providers/
│   │   └── task_provider.dart       # State management dengan Provider
│   ├── screens/
│   │   └── home_screen.dart         # Halaman utama To-Do List
│   └── services/
│       └── notification_service.dart # FCM Service
├── android/
│   └── app/
│       ├── google-services.json     # Firebase config (harus diedit)
│       └── build.gradle.kts
└── pubspec.yaml
```

## ✨ Fitur

1. **Tambah Tugas** - Input tugas baru melalui dialog
2. **Hapus Tugas** - Hapus tugas individual (swipe atau tombol hapus)
3. **Hapus Semua** - Hapus seluruh tugas sekaligus
4. **FCM Integration** - Menerima dan menampilkan push notifications
5. **State Management** - Menggunakan Provider untuk mengelola state

## 🚀 Instalasi

### 1. Persiapan Firebase

1. Buka [Firebase Console](https://console.firebase.google.com/)
2. Buat project baru atau gunakan project yang sudah ada
3. Tambahkan aplikasi Android dengan package name: `com.example.flutter_todolist_fcm`
4. Download file `google-services.json`
5. Ganti file `android/app/google-services.json` dengan file yang sudah didownload

### 2. Setup Firebase di Project

1. Pastikan Anda sudah memiliki project Firebase
2. Aktifkan **Cloud Messaging** di Firebase Console
3. Dapatkan Server Key dari Project Settings > Cloud Messaging

### 3. Build dan Run

```bash
# Install dependencies
flutter pub get

# Build debug APK
flutter build apk --debug

# Atau jalankan langsung di emulator/device
flutter run
```

## 📬 Mengirim Notifikasi

### Via Firebase Console:

1. Buka Firebase Console > Project > Messaging
2. Klik **New Notification**
3. Isi judul dan pesan notifikasi
4. Pilih target ( Topic: "all" atau langsung ke device )
5. Klik **Send**

### Via Postman/cURL:

```bash
curl -X POST \
  -H "Authorization: key=YOUR_FIREBASE_SERVER_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "to": "/topics/all",
    "notification": {
      "title": "To-Do List",
      "body": "Anda memiliki tugas baru!"
    }
  }' \
  https://fcm.googleapis.com/fcm/send
```

## 📸 Screenshot Dokumentasi

### 1. Tampilan Daftar Tugas (Kosong)
- Menampilkan placeholder "Belum ada tugas"
- Tombol + untuk menambah tugas

### 2. Tampilan Daftar Tugas (Dengan Data)
- List tugas dalam card UI
- Nomor urut dan timestamp
- Tombol hapus per tugas

### 3. Proses Penambahan Tugas
- Dialog input tugas
- Snackbar konfirmasi setelah ditambahkan

### 4. Konfirmasi Hapus Semua
- Dialog konfirmasi sebelum menghapus
- Snackbar setelah semua dihapus

### 5. Notifikasi FCM
- Snackbar notifikasi saat aplikasi menerima pesan
- Tampilan notifikasi push dari system

## 🎨 Layout UI

```
┌─────────────────────────────┐
│  ☑ To-Do List          🔔  │  <- AppBar dengan icon FCM
├─────────────────────────────┤
│  📋 Total: 3 tugas         │  <- Header count
├─────────────────────────────┤
│  ┌─────────────────────┐   │
│  │ ① Beli bahan makan   │   │
│  │    5 menit lalu    🗑 │   │  <- Task Card
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ ② Kerjakan tugas    │   │
│  │    1 jam lalu     🗑 │   │
│  └─────────────────────┘   │
│  ┌─────────────────────┐   │
│  │ ③ Meeting project    │   │
│  │    Kemarin        🗑 │   │
│  └─────────────────────┘   │
├─────────────────────────────┤
│   [🗑 Hapus Semua Tugas]   │  <- Bottom Button
└─────────────────────────────┘
          ⊕                    <- FAB Add Task
```

## 📝 Catatan Penting

1. **google-services.json**: Anda HARUS mengganti file ini dengan konfigurasi Firebase Anda sendiri
2. **FCM Token**: Token FCM akan dicetak di console saat debug mode
3. **Topic Subscription**: App otomatis subscribe ke topic "all"
4. **Minimum SDK**: Android 21 (Lollipop)

## 🛠 Troubleshooting

### Error: google-services.json not found
- Pastikan file ada di `android/app/google-services.json`
- Pastikan package name di google-services.json sesuai

### Error: FCM not working
- Pastikan Firebase Cloud Messaging sudah diaktifkan
- Pastikan internet permission sudah ada di AndroidManifest.xml

### Build Error
- Pastikan sudah menjalankan `flutter clean` sebelum build ulang
- Pastikan dependencies sudah ter-install dengan `flutter pub get`

## 📄 Lisensi

Project ini dibuat untuk tujuan edukasi dan demonstration.