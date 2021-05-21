/// count : 19
/// data : [{"completed":false,"_id":"60657c23a899ed00173c3dae","description":"reading book","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-01T07:54:11.140Z","updatedAt":"2021-04-01T07:54:11.140Z","__v":0},{"completed":false,"_id":"60674591fe372300170b1a63","description":"f32t4","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-02T16:25:53.582Z","updatedAt":"2021-04-02T16:25:53.582Z","__v":0},{"completed":false,"_id":"60674593fe372300170b1a64","description":"f32t4","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-02T16:25:55.277Z","updatedAt":"2021-04-02T16:25:55.277Z","__v":0},{"completed":false,"_id":"60674601fe372300170b1a66","description":"f32t4g","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-02T16:27:45.212Z","updatedAt":"2021-04-02T16:27:45.212Z","__v":0},{"completed":false,"_id":"606ae28c5b346c0017037840","description":"sdfsdfsdf","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:12:28.722Z","updatedAt":"2021-04-05T10:12:28.722Z","__v":0},{"completed":false,"_id":"606ae59e5b346c0017037846","description":"dsfsf","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:25:34.312Z","updatedAt":"2021-04-05T10:25:34.312Z","__v":0},{"completed":false,"_id":"606ae5bd5b346c0017037847","description":"sdqdqd","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:26:05.950Z","updatedAt":"2021-04-05T10:26:05.950Z","__v":0},{"completed":false,"_id":"606ae6185b346c0017037848","description":"ssss","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:27:36.191Z","updatedAt":"2021-04-05T10:27:36.191Z","__v":0},{"completed":false,"_id":"606ae6325b346c0017037849","description":"qwqw","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:28:02.516Z","updatedAt":"2021-04-05T10:28:02.516Z","__v":0},{"completed":false,"_id":"606ae64e5b346c001703784a","description":"123","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:28:30.064Z","updatedAt":"2021-04-05T10:28:30.064Z","__v":0},{"completed":false,"_id":"606ae66a5b346c001703784b","description":"4123","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-04-05T10:28:58.948Z","updatedAt":"2021-04-05T10:28:58.948Z","__v":0},{"completed":false,"_id":"608f2fe15794280017b6bb79","description":"reading book","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-02T23:04:01.774Z","updatedAt":"2021-05-02T23:04:01.774Z","__v":0},{"completed":false,"_id":"608f31f25794280017b6bb7b","description":"reading book","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-02T23:12:50.994Z","updatedAt":"2021-05-02T23:12:50.994Z","__v":0},{"completed":false,"_id":"608f36575794280017b6bb7d","description":"reading book","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-02T23:31:35.552Z","updatedAt":"2021-05-02T23:31:35.552Z","__v":0},{"completed":false,"_id":"60a12bb5061b820017c24fcb","description":"213","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-16T14:27:01.708Z","updatedAt":"2021-05-16T14:27:01.708Z","__v":0},{"completed":false,"_id":"60a12c0b061b820017c24fcd","description":"testerino","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-16T14:28:27.985Z","updatedAt":"2021-05-16T14:28:27.985Z","__v":0},{"completed":false,"_id":"60a12c1a061b820017c24fce","description":"testerino","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-16T14:28:42.155Z","updatedAt":"2021-05-16T14:28:42.155Z","__v":0},{"completed":false,"_id":"60a12c56061b820017c24fd1","description":"123","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-16T14:29:42.814Z","updatedAt":"2021-05-16T14:29:42.814Z","__v":0},{"completed":false,"_id":"60a6a7aee7a3fd00170a8803","description":"reading book","owner":"6008cc3e5ab46f0017b8f64e","createdAt":"2021-05-20T18:17:18.590Z","updatedAt":"2021-05-20T18:17:18.590Z","__v":0}]

class TaskModel {
  int _count;
  List<Data> _data;

  int get count => _count;
  List<Data> get data => _data;

  TaskModel({
      int count,
      List<Data> data}){
    _count = count;
    _data = data;
}

  TaskModel.fromJson(dynamic json) {
    _count = json["count"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["count"] = _count;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// completed : false
/// _id : "60657c23a899ed00173c3dae"
/// description : "reading book"
/// owner : "6008cc3e5ab46f0017b8f64e"
/// createdAt : "2021-04-01T07:54:11.140Z"
/// updatedAt : "2021-04-01T07:54:11.140Z"
/// __v : 0

class Data {
  bool _completed;
  String _id;
  String _description;
  String _owner;
  String _createdAt;
  String _updatedAt;
  int _v;

  bool get completed => _completed;
  String get id => _id;
  String get description => _description;
  String get owner => _owner;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  Data({
      bool completed,
      String id,
      String description,
      String owner,
      String createdAt,
      String updatedAt,
      int v}){
    _completed = completed;
    _id = id;
    _description = description;
    _owner = owner;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _completed = json["completed"];
    _id = json["_id"];
    _description = json["description"];
    _owner = json["owner"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["completed"] = _completed;
    map["_id"] = _id;
    map["description"] = _description;
    map["owner"] = _owner;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    return map;
  }

}