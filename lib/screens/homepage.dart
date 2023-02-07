import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/consts/colors.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/todo_tile.dart';
import '../util/dialogue_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('taskbox');
  TaskDataBase db = TaskDataBase();

  @override
  void initState() {
    if (_myBox.get("TASKS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  //TAP ON CHECKBOX
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  //SAVE A TASK
  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //TO ADD NEW TAKS
  void createtaks() {
    showDialog(
        context: context,
        builder: ((context) {
          return DlgBox(
            controller: _controller,
            onSaved: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }));
  }

  //DELETE A NEW TASK
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primaryClr,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          createtaks();
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colors.primaryClr,
          colors.secondaryClr,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              task: db.todoList[index][0],
              isChecked: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTaskButton: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
