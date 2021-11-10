import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';


abstract class RemoteUserSource {
  Future<bool> signIn(Map<String, dynamic> info);
  Future<UserModel?> login(Map<String, dynamic> info);
  Future<bool> logout(VerifiedUser user);
  Future<bool> getVerificationCode();
  Future<VerifiedUserModel> verifyUser(User user, dynamic code);
  Future<UserWithProfileModel> setProfile(VerifiedUser user);
}
