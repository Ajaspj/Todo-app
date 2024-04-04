import 'package:hive_flutter/adapters.dart';
import 'package:task030424/model/todo_model.dart';

class TodoController {
  static List todolistKey = [];

  static var myBox = Hive.box<todomodel>('todo');

  static deleteData(var Key) async {
    await myBox.delete(Key);
    initKey();
  }

  static addData(todomodel item) async {
    await myBox.add(item);
    initKey();
  }

  static initKey() {
    todolistKey = myBox.keys.toList();
  }

  static todomodel? getdata(var key) {
    return myBox.get(key);
  }
}
