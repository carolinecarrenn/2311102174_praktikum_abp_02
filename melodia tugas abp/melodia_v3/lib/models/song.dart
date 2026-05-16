import 'package:flutter/material.dart';

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;
  final int colorIndex;
  final List<Color> gradientColors;
  final String initial;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.colorIndex,
    required this.gradientColors,
    required this.initial,
  });
}

class Album {
  final String id;
  final String title;
  final String artist;
  final int year;
  final int trackCount;
  final int colorIndex;
  final List<Color> gradientColors;
  final String initial;

  const Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.year,
    required this.trackCount,
    required this.colorIndex,
    required this.gradientColors,
    required this.initial,
  });
}
