import 'package:flutter/material.dart';
import 'package:todo/database/database_provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widget/add_task.dart';

class TaskData extends ChangeNotifier {
  List<task> tasks = [
    // task(name: "go shopping", phone: "01026668954"),
    // task(name: "go have fun ", phone: "878857576"),
    // task(name: "cinema", phone: "674747647"),
  ];

  void addtask(String? name, phone) {
    tasks.add(task(name: name!, phone: phone));
    notifyListeners();
  }

  void updateTask(task task) {
    task.doneCange();
    notifyListeners();
  }

  deleteTask(task task) {
    tasks.remove(task);
    notifyListeners();
  }

  Future<List<task>> getData() async {
    tasks = await DatabaseProvider.instance.readAllElements();
    // notifyListeners();
    // return tasks.isEmpty ? [] : tasks;
    if (tasks.isEmpty) {
      tasks = [];
      notifyListeners();
    } else {
      tasks;
      notifyListeners();
    }
    return tasks;
  }
}
