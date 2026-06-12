import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

/// Dialog untuk menambahkan tugas baru dengan deadline dan reminder
class AddTaskDialog extends StatefulWidget {
  final Function(String title, DateTime? deadline, ReminderType reminder,
      DateTime? customReminderTime) onAdd;

  const AddTaskDialog({super.key, required this.onAdd});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDeadline;
  TimeOfDay? _selectedTime;
  ReminderType _selectedReminder = ReminderType.none;
  DateTime? _customReminderTime;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDeadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDeadline = picked;
        // If no time selected, default to 23:59
        if (_selectedTime == null) {
          _selectedTime = const TimeOfDay(hour: 23, minute: 59);
        }
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectCustomReminderTime() async {
    // First select date
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null && mounted) {
      // Then select time
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 9, minute: 0),
      );

      if (time != null) {
        setState(() {
          _customReminderTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _addTask() {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Judul tugas tidak boleh kosong'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Combine date and time
    DateTime? deadline;
    if (_selectedDeadline != null) {
      deadline = DateTime(
        _selectedDeadline!.year,
        _selectedDeadline!.month,
        _selectedDeadline!.day,
        _selectedTime?.hour ?? 23,
        _selectedTime?.minute ?? 59,
      );
    }

    widget.onAdd(title, deadline, _selectedReminder, _customReminderTime);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.add_task, color: Colors.deepPurple),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Tambah Tugas Baru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title field
              TextField(
                controller: _titleController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Judul Tugas',
                  hintText: 'Masukkan nama tugas...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  prefixIcon: const Icon(Icons.edit),
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 16),

              // Deadline section
              const Text(
                '📅 Deadline (Opsional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Date picker
                  Expanded(
                    child: InkWell(
                      onTap: _selectDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 20, color: Colors.deepPurple),
                            const SizedBox(width: 8),
                            Text(
                              _selectedDeadline != null
                                  ? dateFormat.format(_selectedDeadline!)
                                  : 'Pilih Tanggal',
                              style: TextStyle(
                                color: _selectedDeadline != null
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Time picker
                  Expanded(
                    child: InkWell(
                      onTap: _selectTime,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 20, color: Colors.deepPurple),
                            const SizedBox(width: 8),
                            Text(
                              _selectedTime != null
                                  ? timeFormat.format(DateTime(
                                      2000,
                                      1,
                                      1,
                                      _selectedTime!.hour,
                                      _selectedTime!.minute,
                                    ))
                                  : 'Pilih Jam',
                              style: TextStyle(
                                color: _selectedTime != null
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Clear deadline button
              if (_selectedDeadline != null)
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedDeadline = null;
                      _selectedTime = null;
                    });
                  },
                  icon: const Icon(Icons.clear, size: 16),
                  label: const Text('Hapus deadline'),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),

              const SizedBox(height: 16),

              // Reminder section
              const Text(
                '⏰ Reminder (Opsional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),

              // Reminder dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ReminderType>(
                    value: _selectedReminder,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: ReminderType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Row(
                          children: [
                            Icon(
                              type == ReminderType.none
                                  ? Icons.notifications_off
                                  : Icons.notifications_active,
                              size: 20,
                              color: type == ReminderType.none
                                  ? Colors.grey
                                  : Colors.deepPurple,
                            ),
                            const SizedBox(width: 8),
                            Text(type.label),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedReminder = value!;
                        if (value != ReminderType.custom) {
                          _customReminderTime = null;
                        }
                      });
                    },
                  ),
                ),
              ),

              // Custom reminder time picker
              if (_selectedReminder == ReminderType.custom) ...[
                const SizedBox(height: 12),
                InkWell(
                  onTap: _selectCustomReminderTime,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.deepPurple),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.schedule,
                            color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _customReminderTime != null
                                ? '${dateFormat.format(_customReminderTime!)} ${timeFormat.format(_customReminderTime!)}'
                                : 'Pilih waktu reminder...',
                            style: TextStyle(
                              color: _customReminderTime != null
                                  ? Colors.black
                                  : Colors.deepPurple,
                            ),
                          ),
                        ),
                        const Icon(Icons.edit, color: Colors.deepPurple, size: 20),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 24),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _addTask,
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}