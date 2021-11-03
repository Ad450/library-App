

import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';

class UserModel extends User {
  UserModel(
      {required String name,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, id: id, name: name, code: code);

  factory UserModel.fromJson(Map<String, dynamic> _map) {
    return UserModel(email: _map["email"], id: _map["id"], name: _map["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "name": name, "id": id};
  }
}
