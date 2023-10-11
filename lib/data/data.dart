import 'package:hive/hive.dart';

class ToDoDatabase{
  List todoList = [];
  final box = Hive.box('todobox');

  void createInitialData() {
    todoList = [
      ["do exercise",false]
    ];
  }

  void loaddata() {
    todoList = box.get("TODOLIST");
  }

  void updateData() {
    box.put("TODOLIST", todoList);
  }
}