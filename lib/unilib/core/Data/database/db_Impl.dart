import 'package:library_project/unilib/core/Data/database/db.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// have to inject BooksDatabaseImpl as dependency

class BooksDatabaseImpl implements BookDatabase {

  // path of database
  String _databasePath = "books.db";
  // creates or opens a database 
  Database? _database;
  BooksDatabaseImpl._() {
    _initDB();
  }


  // singleton 

  static final BooksDatabaseImpl instance = BooksDatabaseImpl._();

  factory BooksDatabaseImpl() => instance;

  // creates database if one is not created yet

  Future<Database?> _initDB() async {
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

  // retrieve the last item from the list of books in the database

  @override
  Future<BookModels> retrieveCurrentItem() async {
    List<Map<String, dynamic>> items = await _database!.query("books");

    List<BookModels> booksFromDB =  items.map((item) => BookModels.fromJson(item)).toList();
    return booksFromDB.last;
  }


// store book in database
  @override
  void store(BookModels _book) async {
    Map<String, dynamic> value = {
      "name": _book.name,
      "description": _book.description,
      "img": _book.img,
      "id": _book.name
    };
    if (_database != null)
      _database!.insert("books", value);
  }


  // delete book with matching id from database

  Future<void> delete(BookModels _book, dynamic id, String table) async {
    if (_database != null && _database is Database)
      _database!.delete(table, where: 'columnId = ${_book.id}');
  }
}
