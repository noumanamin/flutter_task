import 'package:flutter/material.dart';

/// date : "22/22/22"
/// day : "mon"

class DateModel {
  String date;
  String day;
  Color color;
  bool select = false;

  DateModel({this.date, this.day, this.color, this.select});

  DateModel.fromJson(dynamic json) {
    date = json["date"];
    day = json["day"];
    color = json["color"];
    select = json["select"] ?? false;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = date;
    map["day"] = day;
    map["color"] = color;
    map["select"] = select;
    return map;
  }
}
