import 'package:flutter/material.dart';
import '../models/music_data.dart';
import '../models/theme.dart';
import '../widgets/artwork_widget.dart';
import 'player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = MusicData.songs;

    return Scaffold(
      backgroundColor: MelodiaTheme.bg,
      body: CustomScrollView(
        slivers: [
          // ── App Bar ─────────────────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: MelodiaTheme.bg,
            title: const Text('melodia',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                  color: MelodiaTheme.textPrimary,
                )),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded,
                    color: MelodiaTheme.textSecondary),
                onPressed: () {},
              ),
              const SizedBox(width: 4),
            ],
          ),

          // ── Featured Card (Stack) ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: _FeaturedCard(song: songs[0]),
            ),
          ),

          // ── Section: Mood Playlist — ListView VERTIKAL 3 item statis (A, B, C) ──
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Text('Mood Playlist',
                  style: TextStyle(
                    color: MelodiaTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  )),
            ),
          ),

          // ListView biasa — 3 item statis vertikal (A, B, C)
          // shrinkWrap + NeverScrollableScrollPhysics agar nested dalam CustomScrollView
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _MoodTile(
                    label: 'A',
                    title: 'Top Hits',
                    subtitle: 'Lagu-lagu paling populer saat ini',
                    icon: Icons.local_fire_department_rounded,
                    color: Color(0xFF3B2D6B),
                    accent: Color(0xFF7B5EA7),
                  ),
                  _MoodTile(
                    label: 'B',
                    title: 'OST Drama',
                    subtitle: 'Soundtrack C-Drama terbaik',
                    icon: Icons.movie_creation_outlined,
                    color: Color(0xFF2E1A00),
                    accent: Color(0xFF8B5E00),
                  ),
                  _MoodTile(
                    label: 'C',
                    title: 'Chill Mode',
                    subtitle: 'Musik santai untuk relaksasi',
                    icon: Icons.nights_stay_rounded,
                    color: Color(0xFF0D2137),
                    accent: Color(0xFF2980B9),
                  ),
                ],
              ),
            ),
          ),

          // ── Section: Recently Played — ListView.separated (horizontal) ──────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Text('Recently Played',
                  style: TextStyle(
                    color: MelodiaTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  )),
            ),
          ),

          // ListView.separated — horizontal scroll dengan separator
          SliverToBoxAdapter(
            child: SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: songs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return GestureDetector(
                    onTap: () => _openPlayer(context, index),
                    // Container — kotak berwarna per item
                    child: Container(
                      width: 72,
                      decoration: BoxDecoration(
                        color: MelodiaTheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ArtworkWidget(
                            colorIndex: song.colorIndex,
                            size: 48,
                            borderRadius: 8,
                            gradientColors: song.gradientColors,
                            initial: song.initial,
                            songTitle: song.title,
                            artistName: song.artist,
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              song.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: MelodiaTheme.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ── Section: All Songs — ListView.builder ───────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Text('All Songs',
                  style: TextStyle(
                    color: MelodiaTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  )),
            ),
          ),

          // ListView.builder — semua lagu dari data array
          SliverList.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return _SongTile(
                song: song,
                onTap: () => _openPlayer(context, index),
              );
            },
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  void _openPlayer(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerScreen(
          songs: MusicData.songs,
          initialIndex: index,
        ),
      ),
    );
  }
}

// ─── Mood Tile — item ListView vertikal statis (A, B, C) ─────────────────────

class _MoodTile extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color accent;

  const _MoodTile({
    required this.label,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      // Container — kotak berwarna
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        // Stack — konten + dekorasi bertumpuk
        child: Stack(
          children: [
            // Dekorasi label huruf besar di belakang (Stack layer 0)
            Positioned(
              right: 16,
              top: -8,
              child: Text(
                label,
                style: TextStyle(
                  color: accent.withOpacity(0.18),
                  fontSize: 64,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
            ),
            // Lingkaran dekoratif (Stack layer 1)
            Positioned(
              right: -10,
              bottom: -10,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withOpacity(0.12),
                ),
              ),
            ),
            // Konten teks + ikon (Stack layer 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: accent, size: 20),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                            style: const TextStyle(
                              color: MelodiaTheme.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(height: 2),
                        Text(subtitle,
                            style: const TextStyle(
                              color: MelodiaTheme.textSecondary,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      color: accent.withOpacity(0.5), size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Featured Card (Stack) ────────────────────────────────────────────────────

class _FeaturedCard extends StatelessWidget {
  final dynamic song;
  const _FeaturedCard({required this.song});

  @override
  Widget build(BuildContext context) {
    final accentColor = MelodiaTheme.artworkAccent(song.colorIndex);
    final bgColor = MelodiaTheme.artwork(song.colorIndex);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              PlayerScreen(songs: MusicData.songs, initialIndex: 0),
        ),
      ),
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            // Background Container
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Lingkaran dekoratif besar (Stack layer)
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor.withOpacity(0.12),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor.withOpacity(0.08),
                ),
              ),
            ),
            // Artwork besar (Stack layer)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: ArtworkWidget(
                  colorIndex: song.colorIndex,
                  size: 110,
                  borderRadius: 16,
                  gradientColors: song.gradientColors,
                  initial: song.initial,
                  songTitle: song.title,
                  artistName: song.artist,
                ),
              ),
            ),
            // Teks konten (Stack layer)
            Positioned(
              left: 20,
              top: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'NOW PLAYING',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    song.title,
                    style: const TextStyle(
                      color: MelodiaTheme.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artist,
                    style: const TextStyle(
                      color: MelodiaTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.play_circle_filled_rounded,
                          color: accentColor, size: 32),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Play Now',
                              style: TextStyle(
                                  color: MelodiaTheme.textPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          Text(song.duration,
                              style: const TextStyle(
                                  color: MelodiaTheme.textSecondary,
                                  fontSize: 11)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Song Tile ────────────────────────────────────────────────────────────────

class _SongTile extends StatelessWidget {
  final dynamic song;
  final VoidCallback onTap;

  const _SongTile({required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            ArtworkWidget(
              colorIndex: song.colorIndex,
              size: 50,
              borderRadius: 10,
              gradientColors: song.gradientColors,
              initial: song.initial,
              songTitle: song.title,
              artistName: song.artist,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      color: MelodiaTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    song.artist,
                    style: const TextStyle(
                      color: MelodiaTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              song.duration,
              style:
                  const TextStyle(color: MelodiaTheme.textMuted, fontSize: 12),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.more_horiz_rounded,
                color: MelodiaTheme.textMuted, size: 20),
          ],
        ),
      ),
    );
  }
}
