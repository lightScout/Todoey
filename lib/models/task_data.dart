import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(name: 'Buy bread'),
    Task(name: 'Buy banana'),
    Task(name: 'Buy coffe'),
  ];

  //safe way to tap into the list without being able to modify it.
  UnmodifiableListView<Task> get tasksList {
    return UnmodifiableListView(_tasksList);
  }

  int get taskCount {
    return _tasksList.length;
  }

  void addTask(String taskName) {
    _tasksList.add(
      Task(name: taskName),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
