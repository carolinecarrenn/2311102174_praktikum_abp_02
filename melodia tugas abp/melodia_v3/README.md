# 🎵 Melodia — Music Player UI

A clean, minimal music player UI built with Flutter — featuring **live artwork and artist photos** pulled from the Deezer API.

> **Flutter UI project** — no audio playback, UI only. Artwork loads from internet via Deezer's free public API (no API key needed).

---

## Features

- 🏠 **Home** — Featured "Now Playing" card, recently played scroll, full song list
- 📚 **Library** — Albums grid (GridView) + Tracks with separators (ListView.separated)  
- 🔍 **Search** — Live filter + genre browse section
- 🎧 **Player** — Full-screen player with **artist photo background**, album cover art, controls

## Live Artwork via Deezer API

Every song automatically fetches:
- 🖼️ **Album cover** (500×500) — shown as artwork in lists and player
- 👤 **Artist photo** — used as blurred background on the player screen
- Graceful fallback to gradient + Chinese initial if offline or not found

No API key required — uses Deezer's free public API.

---

## Setup

```bash
# 1. Create a new Flutter project, then replace lib/ with this lib/
flutter create melodia
cd melodia

# Or clone and:
flutter pub get

# 2. Add internet permission (Android)
# In android/app/src/main/AndroidManifest.xml, inside <manifest>:
# <uses-permission android:name="android.permission.INTERNET"/>

# 3. Run
flutter run
```

## Dependencies

| Package | Purpose |
|---------|---------|
| `http` | Deezer API calls |
| `cached_network_image` | Efficient image loading + caching |

---

## Widget Coverage

| Widget | Where |
|--------|-------|
| `Container` | Artwork cards, genre tiles, progress bar, featured card |
| `GridView.builder` | Albums tab in Library |
| `ListView` | Genre list in Search (static 3 items) |
| `ListView.builder` | Song list on Home, search results |
| `ListView.separated` | Tracks tab + quick picks in Search |
| `Stack` | Featured card, Player screen (artist bg + content layers) |

---

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── song.dart              # Data classes
│   ├── music_data.dart        # 52 songs, 18 albums (Mandopop + C-Drama OST)
│   ├── deezer_service.dart    # Deezer API integration
│   └── theme.dart             # Colors & ThemeData
├── widgets/
│   └── artwork_widget.dart    # Smart artwork (Deezer fetch + gradient fallback)
└── screens/
    ├── main_scaffold.dart
    ├── home_screen.dart
    ├── library_screen.dart
    ├── search_screen.dart
    └── player_screen.dart
```

---

Built with Flutter · Artwork by Deezer API · No login required
