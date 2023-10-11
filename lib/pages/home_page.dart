

// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/data.dart';
import 'package:to_do/utils/dilog_box.dart';
import 'package:to_do/utils/to_do_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {

  final todoBox = Hive.box('todobox');

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {

    if(todoBox.get("TODOLIST") == null) {
      db.createInitialData();
    } 

    else {
      db.loaddata();
    }


    super.initState();
  }

  final textController = TextEditingController();

  void onChanged(bool? value,int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveText() {
    setState(() {
      db.todoList.add([textController.text,false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createTask() {
    showDialog(
     context: context,
     builder: (context) {
      return DialogBox(
        controller: textController,
        onSave: saveText,
        onCancel: () => Navigator.of(context).pop(),
      );
     });
  }

  void deleteFunc(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
        title: const Text(
          "TO DO",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        backgroundColor: Colors.green[400],
        child: const Icon(
          Icons.add,
          color: Colors.black
          ),
        ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDo(
            taskName: db.todoList[index][0], 
            isCompleted: db.todoList[index][1], 
            onChanged: (value) => onChanged(value,index),
            deleteFunction: (context) => deleteFunc(index),
            );
        },
      )
    );
  }
}