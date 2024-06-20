import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task030424/model/todo_model.dart';
import 'package:task030424/view/homeScreen.dart/Homescreen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());

  await Hive.openBox<TodoModel>('todoBox');

  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueAccent,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
