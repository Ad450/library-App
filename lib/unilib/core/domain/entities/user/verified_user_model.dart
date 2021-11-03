import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';


class VerifiedUserModel extends VerifiedUser {
  VerifiedUserModel(
      {required String name,
      required String email,
      required int id,
      dynamic code})
      : super(email: email, name: name, id: id, code: code);
}
