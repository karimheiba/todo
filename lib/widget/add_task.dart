import 'package:flutter/material.dart';
import 'package:todo/database/database_provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/task_data.dart';
import 'package:todo/widget/text_field.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  GlobalKey<FormState> _hello = GlobalKey<FormState>();

  updateuser(int id) {
    DatabaseProvider.instance
        .updateUser(task(id: id, name: name, phone: phone));
  }

  Adddata(BuildContext context) {
    _hello.currentState?.save();
    DatabaseProvider.instance.createUser(task(name: name, phone: phone));

    Provider.of<TaskData>(context, listen: false).addtask(name!, phone);
  }

  String? name, phone;
  bool isNew = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _hello,
      child: AlertDialog(
        content: SizedBox(
          height: 250,
          width: 200,
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Add Note",
                    style: TextStyle(fontSize: 22, color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AddTextField(
                  insitialValue: name,
                  onSaved: (nameValue) {
                    name = nameValue;
                  },
                  hinttext: 'Add name',
                  onchange: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                AddTextField(
                  insitialValue: phone,
                  hinttext: "Enter phone",
                  onSaved: (phoneValue) {
                    phone = phoneValue;
                  },
                  onchange: (value) {
                    phone = value;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                  onPressed: () {
                    Adddata(context);
                    print(phone);
                    Navigator.pop(context);
                  },
                  child: Text(
                    isNew ? "Edit Note " : "New Note",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
