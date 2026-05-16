import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';
import '../models/theme.dart';
import '../models/deezer_service.dart';
import '../widgets/artwork_widget.dart';

class PlayerScreen extends StatefulWidget {
  final List<Song> songs;
  final int initialIndex;

  const PlayerScreen({
    super.key,
    required this.songs,
    required this.initialIndex,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late int _index;
  bool _isLiked = false;

  // Audio player
  final AudioPlayer _player = AudioPlayer();
  bool _isLoadingAudio = false;
  bool _hasPreview = false;
  Duration _position = Duration.zero;
  Duration _duration = const Duration(seconds: 30);
  StreamSubscription? _posSub;
  StreamSubscription? _durSub;
  StreamSubscription? _stateSub;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;

    // Listen to position updates
    _posSub = _player.positionStream.listen((pos) {
      if (mounted) setState(() => _position = pos);
    });
    _durSub = _player.durationStream.listen((dur) {
      if (mounted && dur != null) setState(() => _duration = dur);
    });
    _stateSub = _player.playerStateStream.listen((state) {
      if (mounted) setState(() {});
    });

    _loadPreview();
  }

  @override
  void dispose() {
    _posSub?.cancel();
    _durSub?.cancel();
    _stateSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  Song get _song => widget.songs[_index];

  Future<void> _loadPreview() async {
    setState(() {
      _isLoadingAudio = true;
      _hasPreview = false;
      _position = Duration.zero;
    });
    await _player.stop();

    final result = await DeezerService.search(_song.title, _song.artist);
    if (!mounted) return;

    if (result != null && result.previewUrl.isNotEmpty) {
      try {
        await _player.setUrl(result.previewUrl);
        setState(() {
          _hasPreview = true;
          _isLoadingAudio = false;
        });
        // Langsung play
        await _player.play();
      } catch (_) {
        if (mounted) setState(() => _isLoadingAudio = false);
      }
    } else {
      setState(() => _isLoadingAudio = false);
    }
  }

  void _prev() {
    setState(() {
      _index = (_index - 1 + widget.songs.length) % widget.songs.length;
      _position = Duration.zero;
    });
    _loadPreview();
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % widget.songs.length;
      _position = Duration.zero;
    });
    _loadPreview();
  }

  void _togglePlay() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  void _seekTo(double ratio) {
    final ms = (ratio * _duration.inMilliseconds).round();
    _player.seek(Duration(milliseconds: ms));
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = MelodiaTheme.artworkAccent(_song.colorIndex);
    final bgColor = MelodiaTheme.artwork(_song.colorIndex);
    final isPlaying = _player.playing;
    final progress = _duration.inMilliseconds > 0
        ? (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      backgroundColor: MelodiaTheme.bg,
      body: Stack(
        children: [
          // Layer 0: Foto artis dari Deezer sebagai background
          Positioned.fill(
            child: ArtistPhotoWidget(
              artistName: _song.artist,
              size: double.infinity,
              borderRadius: 0,
              gradientColors: _song.gradientColors,
              initial: _song.initial,
              colorIndex: _song.colorIndex,
            ),
          ),
          Positioned.fill(
            child: Container(color: MelodiaTheme.bg.withOpacity(0.82)),
          ),

          // Layer 1: Background blob — Container
          Positioned(
            top: -80, left: -60,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor.withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            bottom: 100, right: -80,
            child: Container(
              width: 220, height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor.withOpacity(0.06),
              ),
            ),
          ),

          // Layer 2: Konten utama
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded,
                            color: MelodiaTheme.textSecondary, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Expanded(
                        child: Text('Now Playing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MelodiaTheme.textSecondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          )),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz_rounded,
                            color: MelodiaTheme.textSecondary),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Artwork — Stack dalam Stack
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity, height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.25),
                              blurRadius: 60,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      ArtworkWidget(
                        colorIndex: _song.colorIndex,
                        size: double.infinity,
                        borderRadius: 24,
                        gradientColors: _song.gradientColors,
                        initial: _song.initial,
                        songTitle: _song.title,
                        artistName: _song.artist,
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Info lagu + like
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_song.title,
                              style: const TextStyle(
                                color: MelodiaTheme.textPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              )),
                            const SizedBox(height: 4),
                            Text(_song.artist,
                              style: const TextStyle(
                                color: MelodiaTheme.textSecondary,
                                fontSize: 15,
                              )),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isLiked = !_isLiked),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            key: ValueKey(_isLiked),
                            color: _isLiked ? accentColor : MelodiaTheme.textMuted,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Badge preview 30 detik
                if (_hasPreview)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: accentColor.withOpacity(0.3)),
                      ),
                      child: Text('▶ Preview 30 detik via Deezer',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        )),
                    ),
                  ),
                if (!_hasPreview && !_isLoadingAudio)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('Preview tidak tersedia untuk lagu ini',
                      style: const TextStyle(
                        color: MelodiaTheme.textMuted,
                        fontSize: 11,
                      )),
                  ),

                const SizedBox(height: 4),

                // Progress bar — Container + Stack
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTapDown: (d) {
                          final box = context.findRenderObject() as RenderBox;
                          final localX = d.localPosition.dx;
                          final ratio = (localX / (box.size.width - 56)).clamp(0.0, 1.0);
                          _seekTo(ratio);
                        },
                        onHorizontalDragUpdate: (d) {
                          final box = context.findRenderObject() as RenderBox;
                          final newVal = (progress + d.delta.dx / (box.size.width - 56))
                              .clamp(0.0, 1.0);
                          _seekTo(newVal);
                        },
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: MelodiaTheme.surfaceHigh,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Stack(
                            children: [
                              // Progress bar terisi
                              FractionallySizedBox(
                                widthFactor: progress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _hasPreview ? accentColor : MelodiaTheme.textMuted,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              // Thumb
                              Positioned(
                                left: progress * (MediaQuery.of(context).size.width - 56 - 12) - 6,
                                top: -4.5,
                                child: Container(
                                  width: 12, height: 12,
                                  decoration: BoxDecoration(
                                    color: _hasPreview ? accentColor : MelodiaTheme.textMuted,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(_position),
                            style: const TextStyle(color: MelodiaTheme.textMuted, fontSize: 11)),
                          Text(_formatDuration(_duration),
                            style: const TextStyle(color: MelodiaTheme.textMuted, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Kontrol
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shuffle_rounded,
                            color: MelodiaTheme.textMuted, size: 22),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous_rounded,
                            color: MelodiaTheme.textPrimary, size: 36),
                        onPressed: _prev,
                      ),
                      // Tombol play/pause — Container bundar
                      GestureDetector(
                        onTap: _hasPreview ? _togglePlay : null,
                        child: Container(
                          width: 64, height: 64,
                          decoration: BoxDecoration(
                            color: _hasPreview ? accentColor : MelodiaTheme.surfaceHigh,
                            shape: BoxShape.circle,
                          ),
                          child: _isLoadingAudio
                              ? Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: MelodiaTheme.textPrimary,
                                  ),
                                )
                              : Icon(
                                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                  color: _hasPreview ? MelodiaTheme.bg : MelodiaTheme.textMuted,
                                  size: 32,
                                ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next_rounded,
                            color: MelodiaTheme.textPrimary, size: 36),
                        onPressed: _next,
                      ),
                      IconButton(
                        icon: const Icon(Icons.repeat_rounded,
                            color: MelodiaTheme.textMuted, size: 22),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}
