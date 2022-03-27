import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/database_provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/task_data.dart';
import 'package:todo/widget/listtile_list.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  final bool? checkboxstate = false;

  bool? ischecked = false;

  late Future future;

  void Function(bool?)? checkboxchange;
  @override
  void initState() {
    super.initState();
    future = Provider.of<TaskData>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Consumer<TaskData>(
                  builder: (context, taskdata, child) {
                    return ListView.builder(
                        itemCount: taskdata.tasks.length,
                        itemBuilder: (context, index) {
                          return ListTileList(
                              delete: () {
                                taskdata.deleteTask(taskdata.tasks[index]);
                              },
                              checkboxstate: taskdata.tasks[index].isDone,
                              checkboxchange: (newValue) {
                                taskdata.updateTask(taskdata.tasks[index]);
                              },
                              taskname: taskdata.tasks[index].name!,
                              taskphone: taskdata.tasks[index].phone!);
                        });
                  },
                )
              : snapshot.hasError
                  ? Text('ERRRRRORRRR')
                  : CircularProgressIndicator();
        });
  }
}
