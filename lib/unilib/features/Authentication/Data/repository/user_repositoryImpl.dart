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
    return await guardedCache<void>(() => _localUserDataSource.deleteCachedUser());
  }

  @override
  Future<UserModel> getCachedUser() async {
    return await guardedCache(<UserModel>() => _localUserDataSource.getCachedUser());
  }

  @override
  Future<void> getVerificationCode({required String email, required String password}) async {
    return await guardedApiCall<void>(
      () => _remoteUserDataSource.getVerificationCode(email: email, password: password),
    );
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final _user = await guardedApiCall<UserModel>(
      () => _remoteUserDataSource.login(email: email, password: password),
    );
    cacheUser(_user);

    return _user;
  }

  @override
  Future<void> logout() async {
    return await deleteCachedUser();
  }

  @override
  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword,
      required String id}) async {
    final _user = await guardedApiCall(
      () => _remoteUserDataSource.updateUser(
          name: name, email: email, oldPassword: oldPassword, newPassword: newPassword, id: id),
    );

    cacheUser(_user);
    return _user;
  }

  @override
  Future<void> verifyCode({required String email, required String code}) async {
    return await guardedApiCall<void>(
      () => _remoteUserDataSource.verifyCode(email: email, code: code),
    );
  }
}
