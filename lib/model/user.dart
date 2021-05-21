/// age : 25
/// _id : "6008cc3e5ab46f0017b8f64e"
/// name : "Muhammad Nur Ali"
/// email : "muh.nurali43@gmail.com"
/// createdAt : "2021-01-21T00:35:10.193Z"
/// updatedAt : "2021-05-20T16:55:01.098Z"
/// __v : 1277

class User {
  int age;
  String id;
  String name;
  String email;
  String createdAt;
  String updatedAt;
  int v;

  User({
      this.age, 
      this.id, 
      this.name, 
      this.email, 
      this.createdAt, 
      this.updatedAt, 
      this.v});

  User.fromJson(dynamic json) {
    age = json["age"];
    id = json["_id"];
    name = json["name"];
    email = json["email"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["age"] = age;
    map["_id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

}