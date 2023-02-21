import 'package:ashish_flutter/util/my_button.dart';
import 'package:flutter/material.dart';

class CostumeAlertDialogue extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  CostumeAlertDialogue(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
           
                MyButton(text: "Cancel", onPressed: onCancel),
                     const SizedBox(
                  width: 16,
                ),
                     MyButton(text: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
