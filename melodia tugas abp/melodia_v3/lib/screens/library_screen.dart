import 'package:flutter/material.dart';
import '../models/music_data.dart';
import '../models/theme.dart';
import '../widgets/artwork_widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MelodiaTheme.bg,
      appBar: AppBar(
        title: const Text('Library'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: TabBar(
            controller: _tabController,
            indicatorColor: MelodiaTheme.accent,
            indicatorWeight: 1.5,
            labelColor: MelodiaTheme.accent,
            unselectedLabelColor: MelodiaTheme.textMuted,
            labelStyle:
                const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: 'Albums'),
              Tab(text: 'Tracks'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _AlbumsTab(),
          _TracksTab(),
        ],
      ),
    );
  }
}

// ─── Albums Tab — GridView (minimal 6 item, sini 53) ─────────────────────────

class _AlbumsTab extends StatelessWidget {
  const _AlbumsTab();

  @override
  Widget build(BuildContext context) {
    final albums = MusicData.albums;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 20,
        childAspectRatio: 0.82,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return _AlbumCard(album: album);
      },
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final dynamic album;
  const _AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artwork — Container berwarna
        Expanded(
          child: ArtworkWidget(
            colorIndex: album.colorIndex,
            size: double.infinity,
            borderRadius: 14,
            gradientColors: album.gradientColors,
            initial: album.initial,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          album.title,
          style: const TextStyle(
            color: MelodiaTheme.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          '${album.artist} · ${album.year}',
          style: const TextStyle(
            color: MelodiaTheme.textSecondary,
            fontSize: 11,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// ─── Tracks Tab — ListView.separated (list + garis pembatas) ─────────────────

class _TracksTab extends StatelessWidget {
  const _TracksTab();

  @override
  Widget build(BuildContext context) {
    final songs = MusicData.songs;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: songs.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 0.5,
        color: MelodiaTheme.border,
        indent: 84,
        endIndent: 20,
      ),
      itemBuilder: (context, index) {
        final song = songs[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: MelodiaTheme.textMuted,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 12),
              ArtworkWidget(
                colorIndex: song.colorIndex,
                size: 48,
                borderRadius: 8,
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
                      '${song.artist} · ${song.album}',
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
                style: const TextStyle(
                    color: MelodiaTheme.textMuted, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
