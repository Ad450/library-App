import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';

class VerifiedUser extends User {
  bool isVerified = true;
  VerifiedUser({required String name, required String email, required int id})
      : super(email: email, name: name, id: id);
}
