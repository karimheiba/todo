import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/database_provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/task_data.dart';

class ListTileList extends StatelessWidget {
  ListTileList({
    Key? key,
    required this.checkboxstate,
    required this.checkboxchange,
    required this.taskname,
    required this.taskphone,
    required this.delete,
  }) : super(key: key);

  final bool? checkboxstate;
  final String taskname;
  final String taskphone;
  final void Function(bool?)? checkboxchange;
  final void Function() delete;
  task deletetask = task();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: checkboxstate,
        onChanged: checkboxchange,
      ),
      title: Text(
        taskname,
        style: TextStyle(
            decoration: checkboxstate! ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(
        taskphone,
        style: TextStyle(
            decoration: checkboxstate! ? TextDecoration.lineThrough : null),
      ),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {},
      ),
      // onLongPress:
    );
  }
}
