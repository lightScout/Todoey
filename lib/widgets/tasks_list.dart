import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksLists extends StatefulWidget {
  @override
  _TasksListsState createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                animation: animation,
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (checkBoxState) {
                  taskData.updateTask(task);
                  controller.forward();
                },
                deleteTask: () {
                  taskData.deleteTask(task);
                },
              ),
              onDismissed: (direction) {
                taskData..deleteTask(task);
              },
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: AlertDialog(
                        backgroundColor: Colors.white10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(123.4),
                          ),
                        ),
                        title: const Text(
                          "CONFIRM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.2,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: const Text(
                          "Are you sure you wish to delete this task?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.2,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 80.0),
                            child: Row(
                              children: <Widget>[
                                FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(123.4),
                                      ),
                                    ),
                                    color: Colors.white,
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("DELETE")),
                                SizedBox(width: 20.0),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(123.4),
                                    ),
                                  ),
                                  color: Colors.white,
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("CANCEL"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              background: Container(
                padding: EdgeInsets.only(left: 10.0),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
