import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class TaskTile extends StatefulWidget {
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
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> with TickerProviderStateMixin {
  double height = 80.0;
  double width = 360.0;
  bool expand = false;
  Color color = Colors.white;
  Color taskTitleColor = Colors.black;
  Color taskDueText = Colors.grey[900];
  AnimationController expandController;
  Animation<double> animation;

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(TaskTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedSize(
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: 1000),
          vsync: this,
          child: GestureDetector(
            onTap: () {
              setState(
                () {
                  expand = !expand;
                  if (expand) {
                    color = Colors.black;
                    taskTitleColor = Colors.white;
                    taskDueText = Colors.grey[200];
                    height = 170.0;
                    width = 370.0;
                  } else {
                    color = Colors.white;
                    taskTitleColor = Colors.black;
                    taskDueText = Colors.grey[900];
                    height = 80.0;
                    width = 360.0;
                  }
                },
              );
            },
            child: Container(
              height: height,
              width: width,
              child: Card(
                color: color,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    expand
                        ? Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircularCheckBox(
                                  value: widget.isChecked,
                                  onChanged: widget.checkBoxCallBack,
                                  activeColor: Color(0xFF00008B),
                                  inactiveColor:
                                      expand ? Colors.white : Colors.black,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                ),
                                title: Text(
                                  widget.taskTitle,
                                  style: TextStyle(
                                    decoration: widget.isChecked
                                        ? TextDecoration.lineThrough
                                        : null,
                                    fontSize: 19.0,
                                    color: widget.isChecked
                                        ? Colors.grey[500]
                                        : taskTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  'By Tomorrow',
                                  style: TextStyle(
                                    color: widget.isChecked
                                        ? Colors.grey[500]
                                        : taskDueText,
                                  ),
                                ),
                                //onLongPress: deleteTask,
                                trailing: Icon(
                                  Icons.delete,
                                  color: widget.isChecked
                                      ? Colors.redAccent
                                      : Colors.grey,
                                  size: widget.isChecked ? 40.0 : 25.0,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 300.0,
                                  minHeight: 40.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Text TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        : ListTile(
                            leading: CircularCheckBox(
                              value: widget.isChecked,
                              onChanged: widget.checkBoxCallBack,
                              activeColor: Color(0xFF00008B),
                              inactiveColor:
                                  expand ? Colors.white : Colors.black,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                            ),
                            title: Text(
                              widget.taskTitle,
                              style: TextStyle(
                                decoration: widget.isChecked
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: 19.0,
                                color: widget.isChecked
                                    ? Colors.grey[500]
                                    : taskTitleColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              'By Tomorrow',
                              style: TextStyle(
                                color: widget.isChecked
                                    ? Colors.grey[500]
                                    : taskDueText,
                              ),
                            ),
                            //onLongPress: deleteTask,
                            trailing: Icon(
                              Icons.delete,
                              color: widget.isChecked
                                  ? Colors.redAccent
                                  : Colors.grey,
                              size: widget.isChecked ? 40.0 : 25.0,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//Checkbox(
//activeColor: Color(0xFF00008B),
//hoverColor: Color(0xFF00008B),
//value: isChecked,
//onChanged: checkBoxCallBack,
//),
