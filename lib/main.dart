import 'package:flutter/material.dart';

import 'package:todo/provider/task_data.dart';
import 'package:todo/screen/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
