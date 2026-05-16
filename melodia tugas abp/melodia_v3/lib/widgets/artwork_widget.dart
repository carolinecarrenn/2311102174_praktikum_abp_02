import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/deezer_service.dart';
import '../models/theme.dart';

/// Smart artwork widget:
///  - Fetches cover art + artist photo from Deezer on first build
///  - Falls back to gradient + initial while loading / on error
class ArtworkWidget extends StatefulWidget {
  final int colorIndex;
  final double size;
  final double borderRadius;
  final List<Color>? gradientColors;
  final String? initial;
  // Required for Deezer fetch
  final String? songTitle;
  final String? artistName;

  const ArtworkWidget({
    super.key,
    required this.colorIndex,
    this.size = 56,
    this.borderRadius = 10,
    this.gradientColors,
    this.initial,
    this.songTitle,
    this.artistName,
  });

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();
}

class _ArtworkWidgetState extends State<ArtworkWidget> {
  String? _imageUrl;
  bool _tried = false;

  @override
  void initState() {
    super.initState();
    _fetchArt();
  }

  Future<void> _fetchArt() async {
    if (widget.songTitle == null || widget.artistName == null) return;
    final result = await DeezerService.search(widget.songTitle!, widget.artistName!);
    if (!mounted) return;
    if (result != null && result.coverBig.isNotEmpty) {
      setState(() {
        _imageUrl = widget.size >= 200 ? result.coverBig : result.coverMedium;
        _tried = true;
      });
    } else {
      setState(() => _tried = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // If we have a network image URL, show it
    if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: CachedNetworkImage(
          imageUrl: _imageUrl!,
          width: widget.size,
          height: widget.size,
          fit: BoxFit.cover,
          placeholder: (_, __) => _GradientPlaceholder(
            size: widget.size,
            borderRadius: widget.borderRadius,
            gradientColors: widget.gradientColors,
            initial: widget.initial,
            colorIndex: widget.colorIndex,
          ),
          errorWidget: (_, __, ___) => _GradientPlaceholder(
            size: widget.size,
            borderRadius: widget.borderRadius,
            gradientColors: widget.gradientColors,
            initial: widget.initial,
            colorIndex: widget.colorIndex,
          ),
        ),
      );
    }

    // While loading or on failure, show gradient placeholder
    return _GradientPlaceholder(
      size: widget.size,
      borderRadius: widget.borderRadius,
      gradientColors: widget.gradientColors,
      initial: widget.initial,
      colorIndex: widget.colorIndex,
    );
  }
}

// ── Gradient placeholder (same as before, used as fallback) ──────────────────

class _GradientPlaceholder extends StatelessWidget {
  final double size;
  final double borderRadius;
  final List<Color>? gradientColors;
  final String? initial;
  final int colorIndex;

  const _GradientPlaceholder({
    required this.size,
    required this.borderRadius,
    required this.gradientColors,
    required this.initial,
    required this.colorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final grad = gradientColors;
    final label = initial;

    if (grad != null && grad.length >= 2 && label != null) {
      final accentColor = grad.last;
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: grad,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -size * 0.12,
              top: -size * 0.12,
              child: Container(
                width: size * 0.65,
                height: size * 0.65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor.withOpacity(0.18),
                ),
              ),
            ),
            Positioned(
              left: -size * 0.1,
              bottom: -size * 0.1,
              child: Container(
                width: size * 0.5,
                height: size * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            Center(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.90),
                  fontSize: size * 0.42,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Fallback: colorIndex based
    final bg = MelodiaTheme.artwork(colorIndex);
    final accent = MelodiaTheme.artworkAccent(colorIndex);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(Icons.music_note_rounded,
            color: accent.withOpacity(0.7), size: size * 0.38),
      ),
    );
  }
}

// ── Artist photo widget — shows artist picture from Deezer ───────────────────

class ArtistPhotoWidget extends StatefulWidget {
  final String artistName;
  final double size;
  final double borderRadius;
  final List<Color>? gradientColors;
  final String? initial;
  final int colorIndex;

  const ArtistPhotoWidget({
    super.key,
    required this.artistName,
    required this.size,
    this.borderRadius = 999,
    this.gradientColors,
    this.initial,
    this.colorIndex = 0,
  });

  @override
  State<ArtistPhotoWidget> createState() => _ArtistPhotoWidgetState();
}

class _ArtistPhotoWidgetState extends State<ArtistPhotoWidget> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    final url = await DeezerService.artistPicture(widget.artistName);
    if (!mounted) return;
    if (url != null && url.isNotEmpty) {
      setState(() => _imageUrl = url);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: CachedNetworkImage(
          imageUrl: _imageUrl!,
          width: widget.size,
          height: widget.size,
          fit: BoxFit.cover,
          placeholder: (_, __) => _placeholder(),
          errorWidget: (_, __, ___) => _placeholder(),
        ),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() => _GradientPlaceholder(
    size: widget.size,
    borderRadius: widget.borderRadius,
    gradientColors: widget.gradientColors,
    initial: widget.initial,
    colorIndex: widget.colorIndex,
  );
}
