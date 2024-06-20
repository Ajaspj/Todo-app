import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  Listview({
    super.key,
    required this.title,
    this.onDelete,
    required this.category,
    this.onpress,
    required this.isChecked,
  });

  final String title;
  final void Function()? onDelete;
  final void Function(bool?)? onpress;
  final String category;
  final bool isChecked;

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        children: [
          Checkbox(value: widget.isChecked, onChanged: widget.onpress),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: widget.isChecked == false
                    ? TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    : TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 3,
                        fontSize: 20,
                      ),
              ),
              Row(
                children: [
                  Text(
                    widget.category,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  widget.isChecked == false
                      ? Text(
                          "Incompleted",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                ],
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: widget.onDelete,
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
