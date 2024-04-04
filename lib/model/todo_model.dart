import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class todomodel {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  bool? iscompleted;
  todomodel({
    this.title,
    this.iscompleted = false,
  });
}
