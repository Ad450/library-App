import 'package:library_project/unilib/core/Data/database/database_collections.dart';

abstract class Database<T> {
  Future<T> read(HiveBoxNames name);
  Future<void> write(T value, HiveBoxNames name);
  Future<void> put(T value, String? key, HiveBoxNames name);
}
