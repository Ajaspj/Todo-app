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
  TextEditingController AddController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    TodoController.initKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          actions: [Icon(Icons.search)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Listview(
                          todoitemKey: TodoController.todolistKey[index],
                          onDelete: () async {
                            await TodoController.deleteData(
                                TodoController.todolistKey[index]);
                            setState(() {});
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                    itemCount: TodoController.todolistKey.length),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 110),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            AddController.clear();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Add new"),
                                content: Form(
                                    key: formKey,
                                    child: TextFormField(
                                      controller: AddController,
                                    )),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await TodoController.addData(
                                              todomodel(
                                                  title: AddController.text,
                                                  iscompleted: false));
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Add"))
                                ],
                              ),
                            );
                          },
                          child: Center(
                            child: Text("Add new",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
