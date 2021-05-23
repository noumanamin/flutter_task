import 'package:flutter_app/model/date_model.dart';

/// band_name : "abc"
/// selcted : "false"
/// date_model : {"date":"22/22/22","day":"mon"}

class BandModel {
  String bandName;
  bool selected = false;
  List<DateModel> dateModel;

  BandModel({this.bandName, this.selected, this.dateModel});

  BandModel.fromJson(dynamic json) {
    bandName = json["band_name"];
    selected = json["selected"] ?? false;
    if (json["date_model"] != null) {
      dateModel = [];
      json["date_model"].forEach((v) {
        dateModel.add(DateModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["band_name"] = bandName;
    map["selected"] = selected;
    if (dateModel != null) {
      map["date_model"] = dateModel.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
