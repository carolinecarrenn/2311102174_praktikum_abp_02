import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/task_provider.dart';
import '../services/notification_service.dart';
import '../models/task.dart';
import '../widgets/add_task_dialog.dart';

/// Main screen displaying the To-Do List
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _setupNotificationListener();
  }

  void _setupNotificationListener() {
    _notificationService.onMessageReceived = (message) {
      final title = message.notification?.title ?? 'New Notification';
      final body = message.notification?.body ?? 'You have a new message';

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔔 $title',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(body),
              ],
            ),
            backgroundColor: Colors.deepPurple,
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    };
  }

  /// Show dialog to add a new task with deadline and reminder
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AddTaskDialog(
        onAdd: (title, deadline, reminderType, customReminderTime) async {
          final taskProvider = context.read<TaskProvider>();
          await taskProvider.addTask(
            title: title,
            deadline: deadline,
            reminderType: reminderType,
            customReminderTime: customReminderTime,
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        deadline != null
                            ? 'Tugas "$title" ditambahkan!\nDeadline: ${_formatDateTime(deadline)}'
                            : 'Tugas "$title" ditambahkan!',
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
      ),
    );
  }

  /// Show confirmation dialog to delete all tasks
  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber, color: Colors.red),
            SizedBox(width: 8),
            Text('Hapus Semua?'),
          ],
        ),
        content: const Text(
          'Apakah Anda yakin ingin menghapus semua tugas? '
          'Tindakan ini tidak dapat dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              await context.read<TaskProvider>().clearAllTasks();
              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.delete_sweep, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Semua tugas berhasil dihapus!'),
                      ],
                    ),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Hapus Semua'),
          ),
        ],
      ),
    );
  }

  /// Delete individual task
  void _deleteTask(Task task) async {
    await context.read<TaskProvider>().removeTask(task.id);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.delete, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(child: Text('Tugas "${task.title}" dihapus')),
            ],
          ),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'BATAL',
            textColor: Colors.white,
            onPressed: () async {
              // Re-add the task
              await context.read<TaskProvider>().addTask(
                    title: task.title,
                    deadline: task.deadline,
                    reminderType: task.reminderType,
                    customReminderTime: task.customReminderTime,
                  );
            },
          ),
        ),
      );
    }
  }

  /// Toggle task completion
  void _toggleTask(Task task) async {
    await context.read<TaskProvider>().toggleTaskCompletion(task.id);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                task.isCompleted
                    ? 'Tugas "${task.title}" selesai!'
                    : 'Tugas "${task.title}" belum selesai',
              ),
            ],
          ),
          backgroundColor: task.isCompleted ? Colors.green : Colors.blue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.checklist_rounded),
            SizedBox(width: 8),
            Text('To-Do List'),
          ],
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // FCM info button
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.info, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '📱 FCM aktif! Kirim notifikasi dari Firebase Console.\n⏰ Schedule notifications aktif untuk tugas dengan deadline.',
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 6),
                ),
              );
            },
            tooltip: 'FCM Status',
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_available,
                    size: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada tugas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tekan tombol + untuk menambah tugas',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.schedule, size: 40, color: Colors.deepPurple),
                        const SizedBox(height: 8),
                        Text(
                          '💡 Tips',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tambahkan deadline dan reminder\nuntuk notifikasi otomatis!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          // Group tasks
          final overdueTasks = taskProvider.overdueTasks;
          final pendingTasks = taskProvider.pendingTasks
              .where((t) => !t.isOverdue && !t.isCompleted)
              .toList();
          final completedTasks = taskProvider.completedTasks;

          return Column(
            children: [
              // Task count header
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.deepPurple.withValues(alpha: 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatChip(
                      icon: Icons.pending_actions,
                      label: 'Pending',
                      count: pendingTasks.length,
                      color: Colors.orange,
                    ),
                    _buildStatChip(
                      icon: Icons.warning,
                      label: 'Terlambat',
                      count: overdueTasks.length,
                      color: Colors.red,
                    ),
                    _buildStatChip(
                      icon: Icons.check_circle,
                      label: 'Selesai',
                      count: completedTasks.length,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              // Task list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Overdue tasks section
                    if (overdueTasks.isNotEmpty) ...[
                      _buildSectionHeader('⚠️ Terlambat', Colors.red),
                      ...overdueTasks.map((task) => _buildTaskCard(task, true)),
                      const SizedBox(height: 16),
                    ],
                    // Pending tasks section
                    if (pendingTasks.isNotEmpty) ...[
                      _buildSectionHeader('📋 Pending', Colors.orange),
                      ...pendingTasks.map((task) => _buildTaskCard(task, false)),
                      const SizedBox(height: 16),
                    ],
                    // Completed tasks section
                    if (completedTasks.isNotEmpty) ...[
                      _buildSectionHeader('✅ Selesai', Colors.green),
                      ...completedTasks.map((task) => _buildTaskCard(task, false)),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddTaskDialog,
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Tambah Tugas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.tasks.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: _showClearAllDialog,
              icon: const Icon(Icons.delete_sweep),
              label: const Text('Hapus Semua Tugas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required int count,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 4),
          Text(
            '$count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _buildTaskCard(Task task, bool isOverdue) {
    final dateFormat = DateFormat('dd MMM, HH:mm');

    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => _deleteTask(task),
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isOverdue
              ? const BorderSide(color: Colors.red, width: 2)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: () => _toggleTask(task),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Checkbox
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: task.isCompleted
                          ? Colors.green
                          : (isOverdue ? Colors.red : Colors.deepPurple),
                      width: 2,
                    ),
                    color: task.isCompleted ? Colors.green : Colors.transparent,
                  ),
                  child: task.isCompleted
                      ? const Icon(Icons.check, size: 18, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                // Task content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: task.isCompleted
                              ? Colors.grey
                              : (isOverdue ? Colors.red : Colors.black),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Deadline info
                      if (task.hasDeadline) ...[
                        Row(
                          children: [
                            Icon(
                              Icons.event,
                              size: 14,
                              color: isOverdue ? Colors.red : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              dateFormat.format(task.deadline!),
                              style: TextStyle(
                                fontSize: 12,
                                color: isOverdue ? Colors.red : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                      // Reminder info
                      if (task.hasReminder) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_active,
                              size: 14,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              task.reminderType == ReminderType.custom &&
                                      task.customReminderTime != null
                                  ? dateFormat.format(task.customReminderTime!)
                                  : task.reminderType.label,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Delete button
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => _deleteTask(task),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime date) {
    return DateFormat('dd MMM yyyy, HH:mm').format(date);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'Baru saja';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} menit lalu';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inDays == 1) {
      return 'Kemarin';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}