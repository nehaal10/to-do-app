
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDo extends StatelessWidget {

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDo({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteFunction
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(20),
            )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black
                ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),)
            ],
          )
        ),
      ),
    );
  }
}