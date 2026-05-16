import 'dart:convert';
import 'package:http/http.dart' as http;

/// Deezer public API — no key required.
/// Docs: https://developers.deezer.com/api
class DeezerService {
  static const _base = 'https://api.deezer.com';

  static final Map<String, DeezerResult?> _cache = {};

  /// Search by "track title artist" — returns cover art, artist photo, dan preview URL 30 detik.
  static Future<DeezerResult?> search(String title, String artist) async {
    final key = '$title|$artist';
    if (_cache.containsKey(key)) return _cache[key];

    try {
      final cleanArtist = artist.split('/').first.trim();
      final query = Uri.encodeComponent('$title $cleanArtist');
      final url = Uri.parse('$_base/search/track?q=$query&limit=1');

      final res = await http.get(url).timeout(const Duration(seconds: 6));
      if (res.statusCode != 200) {
        _cache[key] = null;
        return null;
      }

      final json = jsonDecode(res.body);
      final data = json['data'] as List?;
      if (data == null || data.isEmpty) {
        _cache[key] = null;
        return null;
      }

      final track = data[0];
      final result = DeezerResult(
        coverSmall:      track['album']?['cover']        ?? '',
        coverMedium:     track['album']?['cover_medium']  ?? '',
        coverBig:        track['album']?['cover_xl']      ?? '',
        artistPicSmall:  track['artist']?['picture']        ?? '',
        artistPicMedium: track['artist']?['picture_medium']  ?? '',
        artistPicBig:    track['artist']?['picture_xl']      ?? '',
        trackTitle:      track['title']  ?? title,
        artistName:      track['artist']?['name'] ?? artist,
        albumTitle:      track['album']?['title']  ?? '',
        // Preview 30 detik — Deezer selalu sediain ini gratis
        previewUrl:      track['preview'] ?? '',
      );

      _cache[key] = result;
      return result;
    } catch (_) {
      _cache[key] = null;
      return null;
    }
  }

  /// Search artist picture saja (untuk background player screen).
  static Future<String?> artistPicture(String artist) async {
    final cleanArtist = artist.split('/').first.trim();
    final cacheKey = 'artist|$cleanArtist';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]?.artistPicBig;
    }
    try {
      final query = Uri.encodeComponent(cleanArtist);
      final url = Uri.parse('$_base/search/artist?q=$query&limit=1');
      final res = await http.get(url).timeout(const Duration(seconds: 6));
      if (res.statusCode != 200) return null;
      final json = jsonDecode(res.body);
      final data = json['data'] as List?;
      if (data == null || data.isEmpty) return null;
      return data[0]['picture_xl'] as String?;
    } catch (_) {
      return null;
    }
  }
}

class DeezerResult {
  final String coverSmall;
  final String coverMedium;
  final String coverBig;
  final String artistPicSmall;
  final String artistPicMedium;
  final String artistPicBig;
  final String trackTitle;
  final String artistName;
  final String albumTitle;
  final String previewUrl; // URL mp3 preview 30 detik dari Deezer

  const DeezerResult({
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.artistPicSmall,
    required this.artistPicMedium,
    required this.artistPicBig,
    required this.trackTitle,
    required this.artistName,
    required this.albumTitle,
    required this.previewUrl,
  });
}
