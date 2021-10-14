import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';

class UserWithProfile extends VerifiedUser {
  UserWithProfile(
      {required String email, required String name, required int id})
      : super(name: name, id: id, email: email);
}
