import 'package:flutter/material.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of tasks
  List todoList = [
    ["Do Flutter", false],
    ["Do Excersice", false],
    ["Rank Push", false],
  ];

  //Tapping on checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'ToDo App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 235, 214, 108),
          Colors.white,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              task: todoList[index][0],
              isChecked: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ),
      ),
    );
  }
}
