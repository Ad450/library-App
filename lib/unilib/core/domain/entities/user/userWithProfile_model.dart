import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';


class UserWithProfileModel extends UserWithProfile {
  UserWithProfileModel(
      {required String name,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, name: name, id: id, code: code);
}
