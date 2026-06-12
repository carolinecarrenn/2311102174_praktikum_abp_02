import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/task_provider.dart';
import 'services/notification_service.dart';
import 'services/notification_scheduler.dart';
import 'screens/home_screen.dart';

/// Global notification service instance for FCM
final NotificationService notificationService = NotificationService();

/// Global notification scheduler for local scheduled notifications
final NotificationScheduler notificationScheduler = NotificationScheduler();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize FCM (for push notifications from server)
  await notificationService.initialize();

  // Initialize Notification Scheduler (for local scheduled notifications)
  await notificationScheduler.initialize();

  runApp(const MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'To-Do List FCM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 4,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}