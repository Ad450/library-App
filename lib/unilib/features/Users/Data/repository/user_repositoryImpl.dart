import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_code_sent.dart';
import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl._();
  static final UserRepositoryImpl instance = UserRepositoryImpl._();

  factory UserRepositoryImpl() => instance;

  @override
  Future<bool> getVerificationCode() {
    // TODO: implement getVerificationCode
    throw UnimplementedError();
  }

  @override
  Future<User> login(Map<String, dynamic> info) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> logout(VerifiedUser user) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserWithProfile> setProfile(VerifiedUser user) {
    // TODO: implement setProfile
    throw UnimplementedError();
  }

  @override
  Future<User> signIn(Map<String, dynamic> info) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<VerifiedUser> verifyCode() {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }
}
