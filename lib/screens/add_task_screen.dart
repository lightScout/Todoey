import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  //String newTask;

  @override
  Widget build(BuildContext context) {
    String newTaskTile;
    return Container(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 30.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskTile = value;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  onPressed: () {
                    //Add task to the list
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTile);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
//MaterialButton(
//onPressed: () {},
//minWidth: 300.0,
//height: 50.0,
//color: Colors.lightBlueAccent,
//child: Text(
//'Add',
//style: TextStyle(
//color: Colors.white,
//fontSize: 20.0,
//),
//),
//)
