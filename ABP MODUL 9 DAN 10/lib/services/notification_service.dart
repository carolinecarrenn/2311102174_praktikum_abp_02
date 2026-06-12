import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Service class for handling Firebase Cloud Messaging (FCM)
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Callback for when a notification is received while app is in foreground
  Function(RemoteMessage)? onMessageReceived;

  /// Initialize FCM and request permissions
  Future<void> initialize() async {
    try {
      // Request notification permissions
      final NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (kDebugMode) {
        print('Notification permission status: ${settings.authorizationStatus}');
      }

      // Get FCM token
      final String? token = await _firebaseMessaging.getToken();
      if (kDebugMode) {
        print('FCM Token: $token');
      }

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('Foreground message received:');
          print('Title: ${message.notification?.title}');
          print('Body: ${message.notification?.body}');
        }
        onMessageReceived?.call(message);
      });

      // Handle background messages when app is opened from notification
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('App opened from notification:');
          print('Title: ${message.notification?.title}');
        }
        onMessageReceived?.call(message);
      });

      // Check if app was opened from a notification when app was terminated
      final RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        if (kDebugMode) {
          print('App opened from terminated state:');
          print('Title: ${initialMessage.notification?.title}');
        }
        onMessageReceived?.call(initialMessage);
      }

      // Subscribe to a topic (optional)
      await _firebaseMessaging.subscribeToTopic('all');
      if (kDebugMode) {
        print('Subscribed to topic: all');
      }
    } catch (e) {
      if (kDebugMode) {
        print('FCM initialization error: $e');
      }
    }
  }

  /// Get the current FCM token
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}