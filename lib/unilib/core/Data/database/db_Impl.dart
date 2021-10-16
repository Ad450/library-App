import 'package:library_project/unilib/core/Data/database/db.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// have to inject BooksDatabaseImpl as dependency

class BooksDatabaseImpl implements BookDatabase {
  String _databasePath = "books.db";

  Database? _database;
  BooksDatabaseImpl._() {
    initDB();
  }

  static final BooksDatabaseImpl instance = BooksDatabaseImpl._();

  factory BooksDatabaseImpl() => instance;

  Future<Database?> initDB() async {
    if (_database == null) {
      _database =
          await openDatabase(join(await getDatabasesPath(), _databasePath),
              onCreate: (database, version) {
        return database.execute(
            'CREATE TABLE books(id INTEGER PRIMARY KEY, name TEXT, description TEXT, image TEXT)');
      }, version: 1);
    } else {
      return _database;
    }
  }

  @override
  Future<List<Book>> retrieveCurrentItem() async {
    List<Map<String, dynamic>> items = await _database!.query("books");
    List<Book> _books = items.map((item) => BookModels.fromJson(item)).toList();
    return _books;
  }

  @override
  void store(BookModels _book) async {
    Map<String, dynamic> value = {
      "name": _book.name,
      "description": _book.description,
      "img": _book.img,
    };
    _database!.insert("books", value);
  }
}
