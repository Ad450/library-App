import '../Models/user_model/user_model.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> getVerificationCode(
      {required String email, required String password});

  Future<UserModel> login({required String email, required String password});
  Future<void> logout();

  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword});

  Future<void> verifyCode({required String email, required String code});
}
