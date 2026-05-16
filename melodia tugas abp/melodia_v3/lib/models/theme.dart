import 'package:flutter/material.dart';

class MelodiaTheme {
  // Background palette
  static const Color bg = Color(0xFF0F0F0F);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceHigh = Color(0xFF252525);
  static const Color border = Color(0xFF2E2E2E);

  // Text
  static const Color textPrimary = Color(0xFFF0F0F0);
  static const Color textSecondary = Color(0xFF888888);
  static const Color textMuted = Color(0xFF555555);

  // Accent
  static const Color accent = Color(0xFFF0E6C8); // warm cream

  // Artwork palette (soft, muted)
  static const List<Color> artworkColors = [
    Color(0xFF2D2640), // deep lavender
    Color(0xFF1E3028), // deep sage
    Color(0xFF332B1A), // deep amber
    Color(0xFF331A1A), // deep blush
    Color(0xFF1A2533), // deep sky
    Color(0xFF2A1F33), // deep lilac
  ];

  static const List<Color> artworkAccents = [
    Color(0xFFB5A9F2),
    Color(0xFFA8D5BA),
    Color(0xFFF2C97D),
    Color(0xFFF2A0A0),
    Color(0xFFA0C4F2),
    Color(0xFFC4A8F2),
  ];

  static Color artwork(int index) => artworkColors[index % artworkColors.length];
  static Color artworkAccent(int index) => artworkAccents[index % artworkAccents.length];

  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bg,
    colorScheme: const ColorScheme.dark(
      surface: surface,
      primary: accent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: bg,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
      ),
      iconTheme: IconThemeData(color: textSecondary),
    ),
    useMaterial3: true,
  );
}
