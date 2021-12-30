import '../../../Authentication/Data/Models/user_model/user_model.dart';

abstract class AccountRepository {
  Future<UserModel> updateUser({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> getUser(String id);
}
