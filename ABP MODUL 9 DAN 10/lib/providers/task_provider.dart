import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/notification_scheduler.dart';

/// Provider class for managing Task state using ChangeNotifier
class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  final NotificationScheduler _scheduler = NotificationScheduler();

  /// Get all tasks
  List<Task> get tasks => List.unmodifiable(_tasks);

  /// Get pending (not completed) tasks
  List<Task> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  /// Get completed tasks
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  /// Get total number of tasks
  int get taskCount => _tasks.length;

  /// Get overdue tasks
  List<Task> get overdueTasks => _tasks.where((task) => task.isOverdue).toList();

  /// Add a new task with full options
  Future<void> addTask({
    required String title,
    DateTime? deadline,
    ReminderType reminderType = ReminderType.none,
    DateTime? customReminderTime,
  }) async {
    if (title.trim().isEmpty) return;

    final task = Task.create(
      title: title.trim(),
      deadline: deadline,
      reminderType: reminderType,
      customReminderTime: customReminderTime,
    );

    _tasks.insert(0, task);
    notifyListeners();

    // Schedule notification if reminder is set
    if (task.hasReminder) {
      await _scheduler.scheduleTaskNotification(task);
    }

    if (kDebugMode) {
      print('Task added: ${task.title}');
    }
  }

  /// Legacy method for simple task addition
  void addSimpleTask(String title) {
    addTask(title: title);
  }

  /// Update a task
  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index == -1) return;

    _tasks[index] = updatedTask;
    notifyListeners();

    // Update notification
    await _scheduler.cancelNotification(updatedTask.id);
    if (updatedTask.hasReminder && !updatedTask.isCompleted) {
      await _scheduler.scheduleTaskNotification(updatedTask);
    }
  }

  /// Remove a specific task by ID
  Future<void> removeTask(String id) async {
    await _scheduler.cancelNotification(id);
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  /// Toggle task completion status
  Future<void> toggleTaskCompletion(String id) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index == -1) return;

    final task = _tasks[index];
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);

    _tasks[index] = updatedTask;
    notifyListeners();

    // Cancel notification if completed
    if (updatedTask.isCompleted) {
      await _scheduler.cancelNotification(id);
    } else if (updatedTask.hasReminder) {
      await _scheduler.scheduleTaskNotification(updatedTask);
    }
  }

  /// Remove all tasks from the list
  Future<void> clearAllTasks() async {
    await _scheduler.cancelAllNotifications();
    _tasks.clear();
    notifyListeners();
  }

  /// Check if there are any tasks
  bool get hasTasks => _tasks.isNotEmpty;

  /// Get task by ID
  Task? getTaskById(String id) {
    try {
      return _tasks.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}