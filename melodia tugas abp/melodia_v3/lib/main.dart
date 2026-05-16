import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/theme.dart';
import 'screens/main_scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const Melodia());
}

class Melodia extends StatelessWidget {
  const Melodia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melodia',
      debugShowCheckedModeBanner: false,
      theme: MelodiaTheme.theme,
      home: const MainScaffold(),
    );
  }
}
