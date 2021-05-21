import 'user.dart';

/// user : {"age":25,"_id":"6008cc3e5ab46f0017b8f64e","name":"Muhammad Nur Ali","email":"muh.nurali43@gmail.com","createdAt":"2021-01-21T00:35:10.193Z","updatedAt":"2021-05-20T16:55:01.098Z","__v":1277}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDA4Y2MzZTVhYjQ2ZjAwMTdiOGY2NGUiLCJpYXQiOjE2MjE1Mjk3MDB9.LhqyWsFxQcxaO1qVMnHxdJ-If1yukZye5k_hnTeIle0"

class UserLogin {
  User user;
  String token;

  UserLogin({
      this.user, 
      this.token});

  UserLogin.fromJson(dynamic json) {
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (user != null) {
      map["user"] = user.toJson();
    }
    map["token"] = token;
    return map;
  }

}