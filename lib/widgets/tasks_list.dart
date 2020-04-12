import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasksList[index];
            return Dismissible(
              key: Key('${task.name}${index.toString()}'),
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (checkBoxState) {
                  taskData.updateTask(task);
                },
                deleteTask: () {
                  taskData.deleteTask(task);
                },
              ),
              onDismissed: (direction) {
                taskData..deleteTask(task);
              },
              background: Container(color: Colors.red),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
