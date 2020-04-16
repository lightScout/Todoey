import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function deleteTask;
  final Animation animation;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkBoxCallBack,
      this.deleteTask,
      this.animation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontSize: 15.0,
          color: isChecked ? Colors.grey[500] : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: AnimatedContainer(
        duration: Duration(seconds: 2),
        child: Checkbox(
          activeColor: Color(0xFF00008B),
          hoverColor: Color(0xFF00008B),
          value: isChecked,
          onChanged: checkBoxCallBack,
        ),
      ),
      onLongPress: deleteTask,
    );
  }
}
