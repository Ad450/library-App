import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';

class VerifiedUserModel extends VerifiedUser {
  VerifiedUserModel(
      {required String password,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, password: password, id: id, code: code);
}
