import 'package:library_project/unilib/core/data/database/database_collections.dart';

abstract class Database<T> {
  Future<Map<String, dynamic>> read(HiveBoxNames name, String key);
  Future<void> write(T value, HiveBoxNames name, String? key);
  Future<void> put(
    T value,
    String? key,
    HiveBoxNames name,
  );
}
