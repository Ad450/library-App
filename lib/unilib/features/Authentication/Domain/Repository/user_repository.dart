import '../../Data/Models/user_model/user_model.dart';

abstract class UserRepository {
  //local
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getCachedUser();
  Future<void> deleteCachedUser();

  // remote
  Future<UserModel> getVerificationCode(
      {required String email, required String password});
  Future<void> logout();
  Future<void> verifyCode({required String email, required String code});
  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword});
  Future<UserModel> login({required String email, required String password});
}
