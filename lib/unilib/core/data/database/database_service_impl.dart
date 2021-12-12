import 'package:hive/hive.dart';
import 'package:library_project/unilib/core/data/database/database_collections.dart';
import 'package:library_project/unilib/core/data/database/database_service.dart';
import 'package:library_project/unilib/core/failures.dart';
import '../../../features/Authentication/Data/Models/user_model/user_model.dart';

class BookDatabaseService implements Database<UserModel> {
  @override
  Future<void> put(UserModel value, String? key, HiveBoxNames name) async {
    return await write(value, name, key);
  }

  @override
  Future<Map<String, dynamic>> read(HiveBoxNames name, String key) async {
    if (name is HiveBoxNames) {
      final box = await _openHiveBox<Map<String, dynamic>>(name);
      final data = box.get(key);
      return data?.cast<String, dynamic>() ?? {"data": "notFound"};
    } else {
      throw DatabaseFailure("couldnot read from database");
    }
  }

  @override
  Future<void> write(UserModel value, HiveBoxNames name, String? key) async {
    if (name is HiveBoxNames) {
      final box = await _openHiveBox<Map>(name);
      // the data to be put is a map of key data and value , value
      final _mappedData = <String, dynamic>{"data": value};
      await box.put(key, _mappedData);
    } else {
      throw DatabaseFailure("couldnot write into database");
    }
  }

  Future<void> delete(UserModel user, HiveBoxNames name, String key) async {
    if (name is HiveBoxNames) {
      final _box = await _openHiveBox(name);

      _box.delete(key);
    } else {
      throw DatabaseFailure("couldnot delete user");
    }
  }

  _getBoxId(HiveBoxNames name) => name.index.toStringAsExponential();

  Future<Box<T>> _openHiveBox<T>(HiveBoxNames names) async {
    final _boxId = _getBoxId(names);
    Box<T> box;

    if (Hive.isBoxOpen(_boxId)) {
      box = Hive.box(_boxId);
    } else {
      try {
        box = await Hive.openBox<T>(_boxId);
        return box;
      } catch (_) {
        Hive.deleteBoxFromDisk(_boxId);
        box = await Hive.openBox<T>(_boxId);
        return box;
      }
    }

    return box;
  }
}
