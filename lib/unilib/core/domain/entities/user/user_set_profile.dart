import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';

class UserWithProfile extends VerifiedUser {
  UserWithProfile(
      {required String email,
      required String password,
      required int id,
      dynamic code})
      : super(password: password, id: id, email: email, code: code);
}
