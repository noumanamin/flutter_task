import 'package:flutter/material.dart';
import 'package:flutter_app/screens/band_selection_screen.dart';
import 'package:flutter_app/screens/create_todo_task_screen.dart';
import 'package:flutter_app/screens/new_event_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NewEventScreen()));
              },
              child: Text(
                "Other Screens",
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CreateTodoTaskList()));
              },
              child: Text(
                "Todo Screens",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    ));
  }
}
