import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  String task;
  bool isChecked;
  Function(bool?)? onChanged;
  ToDoList({
    super.key,
    required this.task,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Color.fromARGB(255, 235, 208, 71),
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
                Color.fromARGB(255, 235, 214, 108),
                Colors.white,
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
    );
  }
}
 