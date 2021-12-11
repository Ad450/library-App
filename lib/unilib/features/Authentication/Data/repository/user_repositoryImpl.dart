import 'package:library_project/unilib/core/utils/guarded_api_calls.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/local_data_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_data_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;
  final LocalUserDataSource _localUserDataSource;

  UserRepositoryImpl(this._localUserDataSource, this._remoteUserDataSource);

  @override
  Future<void> cacheUser(UserModel user) async {
    return await guardedCache<void>(
      () => _localUserDataSource.cacheUser(user),
    );
  }

  @override
  Future<void> deleteCachedUser() async {
    return await guardedCache<void>(
        () => _localUserDataSource.deleteCachedUser());
  }

  @override
  Future<UserModel> getCachedUser() async {
    return await guardedCache(
        <UserModel>() => _localUserDataSource.getCachedUser());
  }

  @override
  Future<UserModel> getVerificationCode(
      {required String email, required String password}) {
    // TODO: implement getVerificationCode
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> verifyCode({required String email, required String code}) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }
}
