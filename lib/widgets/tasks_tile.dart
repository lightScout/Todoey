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

class _TaskTileState extends State<TaskTile>
    with SingleTickerProviderStateMixin {
  double height = 75.0;
  double width = 360.0;
  bool expand = false;

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
        AnimatedContainer(
          duration: Duration(milliseconds: 50),
//          padding: EdgeInsets.only(left: 10.0),
          height: height,
          width: width,
          child: GestureDetector(
            onTap: () {
              setState(
                () {
                  expand = !expand;
                  if (expand) {
                    height = 170.0;
                    width = 400.0;
                  } else {
                    height = 75.0;
                    width = 360.0;
                  }
                },
              );
            },
            child: Card(
              //color: Colors.grey[100],

              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: ListTile(
                leading: CircularCheckBox(
                  value: widget.isChecked,
                  onChanged: widget.checkBoxCallBack,
                  activeColor: Color(0xFF00008B),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                ),
                title: Text(
                  widget.taskTitle,
                  style: TextStyle(
                    decoration:
                        widget.isChecked ? TextDecoration.lineThrough : null,
                    fontSize: 19.0,
                    color: widget.isChecked ? Colors.grey[500] : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'By Tomorrow',
                  style: TextStyle(
                    color:
                        widget.isChecked ? Colors.grey[500] : Colors.grey[900],
                  ),
                ),
                //onLongPress: deleteTask,
                trailing: Icon(
                  Icons.delete,
                  color: widget.isChecked ? Colors.redAccent : Colors.grey,
                  size: widget.isChecked ? 40.0 : 25.0,
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
