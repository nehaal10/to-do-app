

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do/utils/button.dart';

class DialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.green[100],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: "enter the task",
                ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
            Row(
              children: [
                Button(text: "Save", onPressed: onSave),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 55, 0)),
                Button(text: "Cancel", onPressed: onCancel)
              ],
            )
          ]),
      ),
    );
  }
}