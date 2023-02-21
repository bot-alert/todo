import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Slidable(
          startActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.green,
            )
          ]),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              )),
        ));
  }
}
