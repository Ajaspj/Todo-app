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
          Expanded(
            child: Text(
              TodoController.getdata(widget.todoitemKey)!.title.toString(),
              style: isChecked == false
                  ? TextStyle(color: Colors.black, fontSize: 18)
                  : TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15),
            ),
          ),
          isChecked == false
              ? Icon(
                  Icons.pending_actions,
                  color: Colors.red,
                  size: 18,
                )
              : Icon(
                  Icons.done_outline,
                  color: Colors.green,
                  size: 18,
                ),
          Spacer(),
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
