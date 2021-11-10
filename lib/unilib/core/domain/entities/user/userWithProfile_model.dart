import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';

class UserWithProfileModel extends UserWithProfile {
  UserWithProfileModel(
      {required String password,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, password: password, id: id, code: code);
}
