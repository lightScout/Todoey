import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:todoey_flutter/widgets/curve_painter.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFA700),
      child: CustomPaint(
        painter: CurvePainter(),
        child: Scaffold(
          //Color(0xFFFFA500)
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
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
              color: Color(0xFF00008B),
              size: 33.3,
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 70.0,
                    left: 20.0,
                    right: 30.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(
                              Icons.list,
                              size: 25.0,
                              color: Color(0xFF00008B),
                            ),
                            backgroundColor: Colors.white,
                            radius: 22.2,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Ciao',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 55.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[500],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(200.0),
                                bottomLeft: Radius.circular(200.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '${Provider.of<TaskData>(context).taskCount}',
                                  style: TextStyle(
                                    fontSize: 44.4,
                                    fontFamily: 'Pacifico',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' tasks',
                                  style: TextStyle(
                                    fontFamily: 'Playfair',
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: TasksLists(),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC100),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(111.1),
                      //topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(111.1),
                    ),
                  ),
                ),
//            Expanded(
//              child: Container(
//                height: 150,
//                decoration: BoxDecoration(
//                  color: Color(0xFFFFFFFF),
////                  borderRadius: BorderRadius.only(
////                    bottomLeft: Radius.circular(130.0),
////                  ),
//                ),
//                child: TasksLists(),
//              ),
//            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
