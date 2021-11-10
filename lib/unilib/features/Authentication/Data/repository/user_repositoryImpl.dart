import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_source.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  RemoteUserSource _remoteUserSource;
  UserRepositoryImpl(this._remoteUserSource);
  // static final UserRepositoryImpl instance = UserRepositoryImpl._();

  // factory UserRepositoryImpl() => instance;

  @override
  Future<bool> getVerificationCode() async {
    return await _remoteUserSource.getVerificationCode();
  }

  @override
  Future<User?> login(Map<String, dynamic> info) async {
    return await _remoteUserSource.login(info);
  }

  @override
  Future<bool> logout(VerifiedUser user) async {
    return await _remoteUserSource.logout(user);
  }

  @override
  Future<UserWithProfile> setProfile(VerifiedUser user) async {
    return await _remoteUserSource.setProfile(user);
  }


  @override
  Future<bool> signIn(Map<String, dynamic> info) async {
    return await _remoteUserSource.signIn(info);
  }

  @override
  Future<VerifiedUser> verifyUser(user, code) {
    // TODO: implement verifyUser
    throw UnimplementedError();
  }

  // @override
  // Future<VerifiedUser> verifyUser(User user, dynamic code) async {
  //   return await _remoteUserSource.verifyUser(user, code);
  // }

  
}
