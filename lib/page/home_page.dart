import 'package:ashish_flutter/configuration/app_bar.dart';
import 'package:ashish_flutter/data/database.dart';
import 'package:ashish_flutter/util/dialouge_box.dart';
import 'package:ashish_flutter/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box("mybox");
  double progessBarValue = 0;
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    progessBarValue =
        db.todoList.map((e) => e[1]).where((element) => element).length /
            db.todoList.length;
    if (progessBarValue.isNaN) {
      progessBarValue = 0;
    }
    super.initState();
  }

  void checkBoxChanged(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      progessBarValue =
          db.todoList.map((e) => e[1]).where((element) => element).length /
              db.todoList.length;
      if (progessBarValue.isNaN) {
        progessBarValue = 0;
      }
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CostumeAlertDialogue(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      progessBarValue =
          db.todoList.map((e) => e[1]).where((element) => element).length /
              db.todoList.length;
      if (progessBarValue.isNaN) {
        progessBarValue = 0;
      }
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.white,
                  minHeight: 18,
                  value: progessBarValue,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(index, value),
              deleteFunction: (context) => deleteTask(index),
            );
          }, childCount: db.todoList.length))
        ],
      ),
    );
  }
}
