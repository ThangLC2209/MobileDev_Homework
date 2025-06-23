import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
    ),
    Task(
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
    ),
    Task(
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
    ),
    Task(
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
    ),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
