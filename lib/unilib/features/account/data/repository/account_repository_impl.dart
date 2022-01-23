import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<UserModel> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser({required String name, required String email, required String password}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
