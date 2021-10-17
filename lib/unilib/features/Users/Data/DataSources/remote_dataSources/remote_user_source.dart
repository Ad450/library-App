import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/features/Users/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';

abstract class RemoteUserSource {
  factory RemoteUserSource() => RemoteUserSourceImpl();
  Future<User> signIn(Map<String, dynamic> info);
  Future<User> login(Map<String, dynamic> info);
  Future<bool> logout(VerifiedUser user);
  Future<bool> getVerificationCode();
  Future<VerifiedUser> verifyUser(User user, dynamic code);
  Future<UserWithProfile> setProfile(VerifiedUser user);
}
