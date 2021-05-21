import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/task_model.dart';
import 'package:flutter_app/model/user_login.dart';
import 'package:flutter_app/utils/contants.dart';
import 'package:http/http.dart' as http;

Future<bool> login({@required String email, @required String password}) async {
  final response = await http.post(
    "https://api-nodejs-todolist.herokuapp.com/user/login",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    loginData = UserLogin.fromJson(json.decode(response.body));
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return false;
  }
}

Future<bool> addTask({@required String task}) async {
  final response = await http.post(
    "https://api-nodejs-todolist.herokuapp.com/task",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${loginData.token}'
    },
    body: jsonEncode(<String, String>{'description': task}),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return false;
  }
}

Future<bool> updateTaskById(
    {@required String task, @required String id}) async {
  final response = await http.put(
    "https://api-nodejs-todolist.herokuapp.com/task/$id",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${loginData.token}'
    },
    body: jsonEncode(<String, String>{'description': task}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return false;
  }
}

Future<bool> deleteTaskById(
    { @required String id}) async {
  final response = await http.delete(
    "https://api-nodejs-todolist.herokuapp.com/task/$id",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${loginData.token}'
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return false;
  }
}

Stream<TaskModel> getAllTask() async* {
  final response = await http.get(
    "https://api-nodejs-todolist.herokuapp.com/task",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${loginData.token}'
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    TaskModel model = TaskModel.fromJson(json.decode(response.body));
    yield model;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
  }
}
