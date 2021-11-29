import 'dart:convert';

import 'package:library_project/unilib/core/Data/database/books_db.dart';
import 'package:library_project/unilib/core/Data/database/email_db.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailSharedPrefs implements EmailDatabase {
  //String collectionName = "books_db";

  EmailSharedPrefs._();

  static final emailInstance = EmailSharedPrefs._();

  factory EmailSharedPrefs.instance() => emailInstance;

  @override
  Future<void> delete(String collectionName) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> retrieveCurrentItem(String collectionName) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    String data = "";
    if (_sharedPreferences.containsKey(collectionName)) {
      data = _sharedPreferences.getString(collectionName)!;
    }
    return data;
  }

  @override
  Future<void> store(String collectionName, String email) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(collectionName, email);
  }
}
