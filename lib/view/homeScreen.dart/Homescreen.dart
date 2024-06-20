import 'package:flutter/material.dart';
import 'package:task030424/controller/todocontroller.dart';
import 'package:task030424/model/todo_model.dart';
import 'package:task030424/view/homeScreen.dart/todolist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addcobtroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? dropDownValue;

  @override
  void initState() {
    TodoController.initKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: Icon(Icons.arrow_back),
          title: Text("ToDo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          centerTitle: true,
          actions: [Icon(Icons.search)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      TodoModel todoModel = TodoController.getdata(
                          TodoController.todolistKey[index])!;
                      return Listview(
                        isChecked: todoModel.isChecked,
                        category: todoModel.category,
                        title: todoModel.title,
                        onpress: (value) async {
                          todoModel.isChecked = value!;
                          await TodoController.checkBox(
                              TodoController.todolistKey[index], todoModel);
                          setState(() {});
                        },
                        onDelete: () async {
                          await TodoController.deleteData(
                              TodoController.todolistKey[index]);
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: TodoController.todolistKey.length),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text("Add to task",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      minRadius: 30,
                      child: IconButton(
                          onPressed: () {
                            addcobtroller.clear();
                            showDialog(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                      builder: (context, alertSetState) =>
                                          AlertDialog(
                                        title: Row(
                                          children: [
                                            Text("Add"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            DropdownButton(
                                              hint: Text("Select"),
                                              value: dropDownValue,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("Home"),
                                                  value: "Home",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Work"),
                                                  value: "Work",
                                                ),
                                              ],
                                              onChanged: (value) {
                                                alertSetState(() {
                                                  dropDownValue = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        content: Form(
                                          key: formKey,
                                          child: TextFormField(
                                            controller: addcobtroller,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  await TodoController.addData(
                                                      TodoModel(
                                                          title: addcobtroller
                                                              .text,
                                                          isChecked: false,
                                                          category:
                                                              dropDownValue!));
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text("Ok"))
                                        ],
                                      ),
                                    ));
                          },
                          icon: Icon(Icons.add)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
