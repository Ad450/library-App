class Books<T> {
  String? _name;
  String? _img;
  int? _id;

  String? get name => _name;

  String? get img => _img;
  int? get id => _id;

  Books({required String name, required String img, required int id})
      : _name = name,
        _img = img,
        _id = id;

  factory Books.fromMap(Map<String, dynamic> _map) {
    return Books(id: _map["id"], name: _map["name"], img: _map["img"]);
  }

  
}
