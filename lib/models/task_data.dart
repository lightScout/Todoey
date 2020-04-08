import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasksList = [
    Task(name: 'Buy bread'),
    Task(name: 'Buy banana'),
    Task(name: 'Buy coffe'),
  ];

  TaskData();

  int get taskCount {
    return tasksList.length;
  }
}
