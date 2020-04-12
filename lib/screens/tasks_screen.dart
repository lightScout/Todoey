import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:circle_list/circle_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                child: AddTaskScreen(),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              )),
              backgroundColor: Colors.transparent,
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 60.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Colors.lightBlueAccent,
                        ),
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).taskCount} Tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.8,
                        ),
                      ),
                    ],
                  ),
//                  Container(
////                  padding: EdgeInsets.only(
////                    top: 60.0,
////                    left: 30.0,
////                    right: 30.0,
////                    bottom: 30.0,
////                  ),
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(20.0),
//                        topRight: Radius.circular(20.0),
//                        bottomRight: Radius.circular(20.0),
//                        bottomLeft: Radius.circular(20.0),
//                      ),
//                    ),
//                    child: Text(
//                      'BLUE',
//                      style: TextStyle(fontSize: 44),
//                    ),
//                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksLists(),
              ),
            ),
//            CircleList(
//              outerRadius: 60.0,
//              initialAngle: 50.0,
//              showInitialAnimation: true,
////              gradient: LinearGradient(
////                colors: [Colors.redAccent, Colors.blueAccent],
////              ),
//              origin: Offset(0, 0),
//              children: List.generate(10, (index) {
//                return Icon(
//                  Icons.details,
//                  color: index % 2 == 0 ? Colors.blue : Colors.orange,
//                );
//              }),
//            ),
          ],
        ),
      ),
    );
  }
}
