import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:todoey_flutter/widgets/curve_painter.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> widthScaleAnimation;
  Animation<double> heightScaleAnimation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    ///Setting up the animation

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
      reverseDuration: Duration(milliseconds: 500),
    );

    widthScaleAnimation = Tween(begin: 40.0, end: 350.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: isExpanded ? Curves.linear : Curves.elasticInOut));
    heightScaleAnimation = Tween(begin: 80.0, end: 200.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: isExpanded ? Curves.linear : Curves.elasticInOut));

    controller.addListener(() {
      setState(() {});
    });

    //controller.addStatusListener(listener)
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                      if (isExpanded) {
                        controller.forward();
                      } else {
                        controller.reverse();
                      }
                    });
                    //controller.reset();
                  },
                  child: Transform.scale(
                    scale: 1.0,
                    child: Container(
                      height: heightScaleAnimation.value,
                      width: widthScaleAnimation.value,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFC100),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(111.1),
                          //topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(111.1),
                        ),
                      ),
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
