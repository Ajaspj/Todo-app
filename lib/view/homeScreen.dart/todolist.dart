import 'package:flutter/material.dart';
import 'package:task030424/controller/todocontroller.dart';

class Listview extends StatefulWidget {
  Listview({super.key, required this.todoitemKey, this.onDelete});

  final todoitemKey;
  final void Function()? onDelete;
  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              TodoController.getdata(widget.todoitemKey)!.title.toString(),
              style: isChecked == false
                  ? TextStyle(color: Colors.black, fontSize: 20)
                  : TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 20),
            ),
          ),
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
