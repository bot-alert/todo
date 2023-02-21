import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  final _myBox = Hive.box("mybox");
//run this only first time ever
  void initialData() {
    todoList = [
      ["Use this app to create TODO", false],
      ["Have fun and Please share it", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
