/// Enum untuk tipe reminder
enum ReminderType {
  none('Tidak ada', 0),
  fifteenMinutes('15 menit sebelum', 15),
  thirtyMinutes('30 menit sebelum', 30),
  oneHour('1 jam sebelum', 60),
  twoHours('2 jam sebelum', 120),
  oneDay('1 hari sebelum', 1440),
  custom('Waktu tertentu', -1);

  final String label;
  final int minutesBefore;
  const ReminderType(this.label, this.minutesBefore);
}

/// Model representing a Task in the To-Do List
class Task {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime? deadline;       // Tanggal & jam deadline
  final ReminderType reminderType; // Tipe reminder
  final DateTime? customReminderTime; // Waktu custom reminder (jika reminderType = custom)
  final bool isCompleted;         // Status selesai

  Task({
    required this.id,
    required this.title,
    required this.createdAt,
    this.deadline,
    this.reminderType = ReminderType.none,
    this.customReminderTime,
    this.isCompleted = false,
  });

  /// Factory constructor to create a new Task with auto-generated ID
  factory Task.create({
    required String title,
    DateTime? deadline,
    ReminderType reminderType = ReminderType.none,
    DateTime? customReminderTime,
  }) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
      deadline: deadline,
      reminderType: reminderType,
      customReminderTime: customReminderTime,
    );
  }

  /// Copy with method untuk update task
  Task copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    DateTime? deadline,
    ReminderType? reminderType,
    DateTime? customReminderTime,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      deadline: deadline ?? this.deadline,
      reminderType: reminderType ?? this.reminderType,
      customReminderTime: customReminderTime ?? this.customReminderTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Check apakah task sudah lewat deadline
  bool get isOverdue {
    if (deadline == null || isCompleted) return false;
    return DateTime.now().isAfter(deadline!);
  }

  /// Get waktu reminder (kalkulasi dari deadline)
  DateTime? get reminderTime {
    if (reminderType == ReminderType.none) return null;
    if (reminderType == ReminderType.custom) return customReminderTime;
    if (deadline == null) return null;
    return deadline!.subtract(Duration(minutes: reminderType.minutesBefore));
  }

  /// Check apakah deadline sudah diset
  bool get hasDeadline => deadline != null;

  /// Check apakah reminder sudah diset
  bool get hasReminder => reminderType != ReminderType.none;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, deadline: $deadline, reminder: $reminderType)';
  }
}