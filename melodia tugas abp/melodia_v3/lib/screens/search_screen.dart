import 'package:flutter/material.dart';
import '../models/music_data.dart';
import '../models/theme.dart';
import '../widgets/artwork_widget.dart';
import 'player_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  List get _results {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    return MusicData.songs
        .where((s) =>
            s.title.toLowerCase().contains(q) ||
            s.artist.toLowerCase().contains(q) ||
            s.album.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;
    final songs = MusicData.songs;

    return Scaffold(
      backgroundColor: MelodiaTheme.bg,
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
            child: Container(
              decoration: BoxDecoration(
                color: MelodiaTheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (v) => setState(() => _query = v),
                style: const TextStyle(
                    color: MelodiaTheme.textPrimary, fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Songs, artists, albums…',
                  hintStyle: TextStyle(
                      color: MelodiaTheme.textMuted, fontSize: 14),
                  prefixIcon: Icon(Icons.search_rounded,
                      color: MelodiaTheme.textMuted, size: 20),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),

          Expanded(
            child: _query.isEmpty
                ? _BrowseSection(songs: songs)
                : _SearchResults(results: results, query: _query),
          ),
        ],
      ),
    );
  }
}

// Browse (empty state) — ListView statis
class _BrowseSection extends StatelessWidget {
  final List songs;
  const _BrowseSection({required this.songs});

  @override
  Widget build(BuildContext context) {
    // Reuse static ListView with 3 genre containers
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jelajahi Genre',
            style: TextStyle(
              color: MelodiaTheme.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),

          // Static ListView — 3 genre containers (ListView widget)
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _GenreContainer(
                label: '华语流行',
                sublabel: 'Mandopop · 38 lagu',
                colorIndex: 0,
                icon: Icons.music_note_rounded,
              ),
              SizedBox(height: 10),
              _GenreContainer(
                label: 'C-Drama OST',
                sublabel: 'Soundtrack Drama · 25 lagu',
                colorIndex: 2,
                icon: Icons.movie_rounded,
              ),
              SizedBox(height: 10),
              _GenreContainer(
                label: '经典老歌',
                sublabel: 'Klasik Mandarin · 19 lagu',
                colorIndex: 4,
                icon: Icons.history_rounded,
              ),
            ],
          ),

          const SizedBox(height: 28),
          const Text(
            'Quick Picks',
            style: TextStyle(
              color: MelodiaTheme.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),

          // ListView.separated — quick picks
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              thickness: 0.5,
              color: MelodiaTheme.border,
              indent: 64,
            ),
            itemBuilder: (context, index) {
              final song = MusicData.songs[index + 3];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ArtworkWidget(
                        colorIndex: song.colorIndex,
                        size: 44,
                        borderRadius: 8,
              gradientColors: song.gradientColors,
              initial: song.initial,
            ,
                              songTitle: song.title,
                              artistName: song.artist,
                            ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(song.title,
                              style: const TextStyle(
                                  color: MelodiaTheme.textPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                          Text(song.artist,
                              style: const TextStyle(
                                  color: MelodiaTheme.textSecondary,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    const Icon(Icons.play_arrow_rounded,
                        color: MelodiaTheme.textMuted, size: 22),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _GenreContainer extends StatelessWidget {
  final String label;
  final String sublabel;
  final int colorIndex;
  final IconData icon;

  const _GenreContainer({
    required this.label,
    required this.sublabel,
    required this.colorIndex,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bg = MelodiaTheme.artwork(colorIndex);
    final accent = MelodiaTheme.artworkAccent(colorIndex);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withOpacity(0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Icon(icon, color: accent, size: 24),
                const SizedBox(width: 14),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            color: MelodiaTheme.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                    Text(sublabel,
                        style: const TextStyle(
                            color: MelodiaTheme.textSecondary,
                            fontSize: 12)),
                  ],
                ),
                const Spacer(),
                Icon(Icons.chevron_right_rounded,
                    color: accent.withOpacity(0.5), size: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Search results
class _SearchResults extends StatelessWidget {
  final List results;
  final String query;

  const _SearchResults({required this.results, required this.query});

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off_rounded,
                color: MelodiaTheme.textMuted, size: 40),
            const SizedBox(height: 12),
            Text('No results for "$query"',
                style: const TextStyle(
                    color: MelodiaTheme.textSecondary, fontSize: 14)),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        thickness: 0.5,
        color: MelodiaTheme.border,
        indent: 62,
      ),
      itemBuilder: (context, index) {
        final song = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ArtworkWidget(
                  colorIndex: song.colorIndex, size: 44, borderRadius: 8,
              gradientColors: song.gradientColors,
              initial: song.initial,
            ,
                              songTitle: song.title,
                              artistName: song.artist,
                            ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.title,
                        style: const TextStyle(
                            color: MelodiaTheme.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    Text('${song.artist} · ${song.album}',
                        style: const TextStyle(
                            color: MelodiaTheme.textSecondary,
                            fontSize: 12)),
                  ],
                ),
              ),
              Text(song.duration,
                  style: const TextStyle(
                      color: MelodiaTheme.textMuted, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
