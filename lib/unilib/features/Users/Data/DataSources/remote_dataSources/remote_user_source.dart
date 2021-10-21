import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Users/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Users/Data/Models/user_model.dart';
import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';

abstract class RemoteUserSource {
  factory RemoteUserSource() => RemoteUserSourceImpl();
  Future<UserModel> signIn(Map<String, dynamic> info);
  Future<UserModel> login(Map<String, dynamic> info);
  Future<bool> logout(VerifiedUser user);
  Future<bool> getVerificationCode();
  Future<VerifiedUserModel> verifyUser(User user, dynamic code);
  Future<UserWithProfileModel> setProfile(VerifiedUser user);
}
