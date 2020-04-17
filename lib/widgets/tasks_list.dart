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
//                deleteTask: () {
//                  taskData.deleteTask(task);
//                },
              ),
              onDismissed: (direction) {
                taskData.deleteTask(task);
              },
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: AlertDialog(
                        backgroundColor: Colors.lightBlue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(123.4),
                          ),
                        ),
                        title: Text(
                          "CONFIRM",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.2,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Playfair',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          "Are you sure you wish to delete this task?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Playfair',
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
                                  color: Colors.redAccent,
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                    "DELETE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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
                                  child: Text("CANCEL"),
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
              background: Center(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 300.0,
                    maxWidth: 380.0,
//                      minWidth: 100.0,
//                      minHeight: 150.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                      topRight: Radius.circular(100.0),
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.delete,
                          size: 30.0,
                          color: Colors.redAccent,
                        ),
                        radius: 30.0,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
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
