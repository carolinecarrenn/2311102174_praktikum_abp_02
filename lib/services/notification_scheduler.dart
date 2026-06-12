import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:flutter_timezone/flutter_timezone.dart';
import '../models/task.dart';

/// Service untuk menangani local notifications terjadwal
class NotificationScheduler {
  static final NotificationScheduler _instance = NotificationScheduler._internal();
  factory NotificationScheduler() => _instance;
  NotificationScheduler._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  /// Initialize notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz_data.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // Android settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS settings
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Request permissions (Android 13+)
    await _requestPermissions();

    _isInitialized = true;
    if (kDebugMode) {
      print('NotificationScheduler initialized');
    }
  }

  /// Request notification permissions
  Future<void> _requestPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? androidPlugin =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
  }

  /// Handle when notification is tapped
  void _onNotificationTapped(NotificationResponse response) {
    if (kDebugMode) {
      print('Notification tapped: ${response.payload}');
    }
  }

  /// Schedule a notification for a task
  Future<void> scheduleTaskNotification(Task task) async {
    if (!_isInitialized) {
      await initialize();
    }

    // Cancel existing notification for this task
    await cancelNotification(task.id);

    // Get notification time
    final DateTime? notificationTime = task.reminderTime;

    if (notificationTime == null) {
      if (kDebugMode) print('No reminder set for task: ${task.title}');
      return;
    }

    // Check if notification time is in the future
    if (notificationTime.isBefore(DateTime.now())) {
      if (kDebugMode) {
        print('Reminder time is in the past, skipping: ${task.title}');
      }
      return;
    }

    // Create notification details
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'task_reminders',
      'Task Reminders',
      channelDescription: 'Notifications for task reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      color: Color.fromARGB(255, 103, 58, 183), // Deep purple
      enableVibration: true,
      playSound: true,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    // Schedule the notification
    final tz.TZDateTime tzTime = tz.TZDateTime.from(
      notificationTime,
      tz.local,
    );

    await _notifications.zonedSchedule(
      task.id.hashCode,
      '📅 Reminder: ${task.title}',
      _getNotificationBody(task),
      tzTime,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: task.id,
    );

    if (kDebugMode) {
      print('Scheduled notification for: ${task.title} at $notificationTime');
    }
  }

  /// Get notification body based on reminder type
  String _getNotificationBody(Task task) {
    if (task.deadline == null) {
      return 'Tugas "${task.title}" perlu perhatian Anda';
    }

    switch (task.reminderType) {
      case ReminderType.fifteenMinutes:
        return 'Tugas "${task.title}" deadline dalam 15 menit!';
      case ReminderType.thirtyMinutes:
        return 'Tugas "${task.title}" deadline dalam 30 menit!';
      case ReminderType.oneHour:
        return 'Tugas "${task.title}" deadline dalam 1 jam!';
      case ReminderType.twoHours:
        return 'Tugas "${task.title}" deadline dalam 2 jam!';
      case ReminderType.oneDay:
        return 'Tugas "${task.title}" deadline besok!';
      case ReminderType.custom:
        return 'Reminder untuk tugas "${task.title}"';
      case ReminderType.none:
        return 'Tugas "${task.title}"';
    }
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(String taskId) async {
    await _notifications.cancel(taskId.hashCode);
    if (kDebugMode) {
      print('Cancelled notification for task: $taskId');
    }
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
    if (kDebugMode) {
      print('Cancelled all notifications');
    }
  }

  /// Show an immediate notification (for testing)
  Future<void> showImmediateNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!_isInitialized) {
      await initialize();
    }

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'task_reminders',
      'Task Reminders',
      channelDescription: 'Notifications for task reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      color: Color.fromARGB(255, 103, 58, 183),
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// Reschedule all task notifications
  Future<void> rescheduleAllTasks(List<Task> tasks) async {
    await cancelAllNotifications();
    for (final task in tasks) {
      if (task.hasReminder && !task.isCompleted) {
        await scheduleTaskNotification(task);
      }
    }
    if (kDebugMode) {
      print('Rescheduled ${tasks.length} task notifications');
    }
  }
}