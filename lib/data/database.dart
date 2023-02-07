import 'dart:ffi';

import "package:hive_flutter/hive_flutter.dart";

class TaskDataBase {
  List todoList = [];
  //REFENRENCE TO THE BOX
  final _myBox = Hive.box('taskbox');

  //DATA SHOWN AT 1ST USE
  void createInitialData() {
    todoList = [
      ['Install the app', false],
      ['Use the app', false],
    ];
  }

  //LOAD THE DATA
  void loadData() {
    todoList = _myBox.get("TASKS");
  }

  //UPDATE THE DATA
  void updateData() {
    _myBox.put("TASKS", todoList);
  }
}
