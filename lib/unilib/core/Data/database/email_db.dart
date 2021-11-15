import 'package:library_project/unilib/core/Data/database/emails_shared_preferences.dart';

abstract class EmailDatabase {
  factory EmailDatabase()=>EmailSharedPrefs.instance();
  Future<void> store(String collectionName, String email);
  Future<String> retrieveCurrentItem(String collectionName);
  Future<void> delete( String collectionName);
}
