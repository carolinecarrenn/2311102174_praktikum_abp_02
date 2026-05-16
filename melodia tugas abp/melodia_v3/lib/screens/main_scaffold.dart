import 'package:flutter/material.dart';
import '../models/theme.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'search_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    LibraryScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: MelodiaTheme.border, width: 0.5),
          ),
        ),
        child: NavigationBar(
          backgroundColor: MelodiaTheme.bg,
          indicatorColor: MelodiaTheme.surfaceHigh,
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: MelodiaTheme.textMuted),
              selectedIcon: Icon(Icons.home_rounded, color: MelodiaTheme.accent),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_music_outlined, color: MelodiaTheme.textMuted),
              selectedIcon: Icon(Icons.library_music_rounded, color: MelodiaTheme.accent),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined, color: MelodiaTheme.textMuted),
              selectedIcon: Icon(Icons.search_rounded, color: MelodiaTheme.accent),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
