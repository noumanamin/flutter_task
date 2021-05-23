import 'package:flutter/material.dart';
import 'package:flutter_app/model/band_model.dart';
import 'package:flutter_app/model/date_model.dart';
import 'package:flutter_app/model/user_login.dart';

UserLogin loginData;

List<DateModel> dateModel = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];
List<DateModel> dateModel1 = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];
List<DateModel> dateModel2 = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];
List<DateModel> dateModel3 = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];
List<DateModel> dateModel4 = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];
List<DateModel> dateModel5 = [
  DateModel(date: "20 Mar", day: "Sun", color: Colors.red, select: true),
  DateModel(date: "21 Mar", day: "Mon", color: Colors.green, select: false),
  DateModel(date: "22 Mar", day: "Tue", color: Colors.pink, select: false),
  DateModel(date: "23 Mar", day: "Wed", color: Colors.amber, select: false),
  DateModel(date: "24 Mar", day: "Thu", color: Colors.blue, select: false),
  DateModel(date: "25 Mar", day: "Fri", color: Colors.brown, select: false),
  DateModel(
      date: "26 Mar", day: "Sat", color: Colors.deepOrange, select: false),
];

List<BandModel> bandList = [
  BandModel(bandName: "The Slowstarters", selected: false, dateModel: dateModel),
  BandModel(bandName: "Blue Moon Band", selected: false, dateModel: dateModel5),
  BandModel(bandName: "Rozi Bak Band", selected: false, dateModel: dateModel1),
  BandModel(bandName: "Brooks & Dunn", selected: false, dateModel: dateModel2),
  BandModel(bandName: "Cultural Band", selected: false, dateModel: dateModel3),
];

List<BandModel> bandListSelected = getList();

List<BandModel> getList() {
  List<BandModel> band = [];
  for (int index = 0; index < bandList.length; index++) {
    if (bandList[index].selected) {
      band.add(bandList[index]);
    }
  }

  return band;
}
