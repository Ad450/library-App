import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';

class UserModel extends User {
  UserModel(
      {required String password,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, id: id, password: password, code: code);

  factory UserModel.fromJson(Map<String, dynamic> _map) {
    return UserModel(email: _map["email"], id: _map["id"], password: "");
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
