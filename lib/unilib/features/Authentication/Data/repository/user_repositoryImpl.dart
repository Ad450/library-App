import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
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
  Future<Either<Failure, bool>> getVerificationCode(
      Map<String, dynamic> info) async {
    return await _remoteUserSource.getVerificationCode(info);
  }

  @override
  Future<Either<Failure, User?>> login(Map<String, dynamic> info) async {
    return await _remoteUserSource.login(info);
  }

  @override
  Future<Either<Failure, bool>> logout(VerifiedUser user) async {
    return await _remoteUserSource.logout(user);
  }

  @override
  Future<Either<Failure, UserWithProfile>> setProfile(VerifiedUser user) async {
    return await _remoteUserSource.setProfile(user);
  }

  @override
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> info) async {
    return await _remoteUserSource.signIn(info);
  }

  @override
  Future<Either<Failure, bool>> verifyUser(String email, String code) {
    return _remoteUserSource.verifyUser(email, code);
  }

  // @override
  // Future<VerifiedUser> verifyUser(User user, dynamic code) async {
  //   return await _remoteUserSource.verifyUser(user, code);
  // }

}
