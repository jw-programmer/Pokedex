class Type {
  int _id;
  String _name;

  Type({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  String get name => _name;

  Type.fromJson(Map<String, dynamic> json) {
    this._id = json['id'];
    this._name = json['name'];
  }
}
