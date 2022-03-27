import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/database_provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/task_data.dart';
import 'package:todo/widget/add_task.dart';
import 'package:todo/widget/task_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  // List<task> userList = [];
  // Future<List<task>> getData() async {
  //   userList = await DatabaseProvider.instance.readAllElements();
  //   print(userList.length);
  //   // notifyListeners();
  //   return userList.isEmpty ? [] : userList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _actionButton(),
      backgroundColor: Colors.cyan,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.playlist_add_check_circle,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Note App",
                  style: TextStyle(
                      fontSize: 31,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${Provider.of<TaskData>(context).tasks.length} tasks",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Expanded(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 252, 252, 252)),
                child: TaskTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _actionButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTask();
            },
          );
        },
        label: const Text("Add task"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
