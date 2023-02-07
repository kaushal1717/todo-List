import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/consts/colors.dart';

class ToDoList extends StatelessWidget {
  String task;
  bool isChecked;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTaskButton;
  ToDoList({
    super.key,
    required this.task,
    required this.isChecked,
    required this.onChanged,
    required this.deleteTaskButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTaskButton,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: colors.checkBoxClr,
              ),
              Text(
                task,
                style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.primaryClr,
                  colors.secondaryClr,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 5,
                )
              ]),
        ),
      ),
    );
  }
}
