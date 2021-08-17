class Books {

  String? _name;
  String? _img;
  int? _id;

  String? get name => _name;

  String? get img => _img;
  int? get id => _id;

  Books({String? name, String? img, int? id})
      : _name = name,
        _img = img,
        _id = id;

  // Books.fromMap({String? name, String? img}):this(name:name, img:img);

 factory Books.fromMap(Map<String, dynamic> _map){
   return Books(id:_map["id"],name: _map["name"] , img: _map["img"]);
 }
        
}
