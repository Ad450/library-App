import 'package:library_project/unilib/core/data/database/database_collections.dart';
import 'package:library_project/unilib/core/data/database/database_service.dart';
import 'package:library_project/unilib/core/failures.dart';

import '../Models/user_model/user_model.dart';

abstract class LocalUserDataSource {
  Future<void> cacheUser(UserModel user);
  Future<void> deleteCachedUser();
  Future<UserModel> getCachedUser();
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final Database _database;
  LocalUserDataSourceImpl(this._database);

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      await _database.write(user, HiveBoxNames.users, "users");
    } on DatabaseFailure {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCachedUser() async {
    try {
      await _database.delete(HiveBoxNames.users, "users");
    } on DatabaseFailure {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getCachedUser() async {
    try {
      final _userMap = await _database.read(HiveBoxNames.users, "users");
      return _userMap["data"];
    } on DatabaseFailure {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
