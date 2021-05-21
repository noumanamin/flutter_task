import 'package:flutter/material.dart';
import 'package:flutter_app/model/task_model.dart';
import 'package:flutter_app/utils/api_calls.dart';

String id = "";

class CreateTodoTaskList extends StatefulWidget {
  @override
  _CreateTodoTaskListState createState() => _CreateTodoTaskListState();
}

class _CreateTodoTaskListState extends State<CreateTodoTaskList> {
  final _formKey = GlobalKey<FormState>();
  var taskController = TextEditingController();

  String taskLabel = "Add Task";
  String tasksUpdate = "Update";
  bool editClick = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    updateTask(String value) {
      print("");
      setState(() {
        editClick = true;
        taskController.text = value;
      });
    }

    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: taskController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter task";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Enter you task"),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    loading
                        ? Image.asset(
                            "assets/icons/giphy.gif",
                            width: 48,
                            height: 48,
                          )
                        : FlatButton(
                            color: Colors.blue,
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              setState(() {
                                loading = true;
                              });
                              if (editClick) {
                                bool flag = await updateTaskById(
                                    task: taskController.text.toString(),
                                    id: id);
                                if (flag) {
                                  setState(() {
                                    taskController.text = "";
                                    editClick = false;
                                    loading = false;
                                  });
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              } else {
                                bool flag = await addTask(
                                  task: taskController.text.toString(),
                                );
                                if (flag) {
                                  setState(() {
                                    taskController.text = "";
                                    editClick = false;
                                    loading = false;
                                  });
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              editClick ? tasksUpdate : taskLabel,
                              style: TextStyle(color: Colors.white),
                            ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: getAllTask(),
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.hasError) {
                          return new Text("Error!");
                        } else if (asyncSnapshot.data == null) {
                          return Container(
                            width: 48,
                            height: 48,
                            child: Image.asset('assets/icons/giphy.gif'),
                          );
                        } else {
                          TaskModel listData = asyncSnapshot.data;
                          List<Data> list = listData.data;
                          list = list.reversed.toList();
                          List<Data> listNew = list;
                          return Container(
                            height: height,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int index = 0;
                                      index < listNew.length;
                                      index++)
                                    Card(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 24),
                                        height: 50,
                                        alignment: Alignment.centerLeft,
                                        width: width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  listNew[index].description),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  id = list[index].id;
                                                  updateTask(listNew[index]
                                                      .description);
                                                },
                                                child: Icon(Icons.edit)),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  return showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                      title: Text("Alert"),
                                                      content: Text(
                                                          "Do You want to delete this item"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: Text("No"),
                                                        ),
                                                        FlatButton(
                                                          onPressed: () {
                                                            deleteTask(
                                                                listNew[index]
                                                                    .id);
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: Text("Okay"),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child:
                                                    Icon(Icons.delete_forever)),
                                            SizedBox(
                                              width: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteTask(String id) async {
    bool flag = await deleteTaskById(id: id);
    setState(() {});
  }
}
