import 'dart:convert';

import 'package:library_project/unilib/core/Data/database/books_db.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs implements BookDatabase {
  String collectionName = "books_db";

  SharedPrefs._();

  static final instance = SharedPrefs._();

  factory SharedPrefs() => instance;

  @override
  Future<void> delete(BookModels _book, id, String table) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<BookModels>> retrieveCurrentItem() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    List<BookModels> _bookList = [];
    String data = "";
    if (_sharedPreferences.containsKey(collectionName)) {
      data = _sharedPreferences.getString(collectionName)!;
    }

    _bookList.add(jsonDecode(data));
    return _bookList;
  }

  @override
  Future<void> store(BookModels _book) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(collectionName, jsonEncode(_book));
  }
}
