import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task030424/model/todo_model.dart';
import 'package:task030424/view/homeScreen.dart/Homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(todomodelAdapter());
  var box = await Hive.openBox<todomodel>('todo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
