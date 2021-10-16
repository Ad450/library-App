import 'package:library_project/unilib/core/Data/database/db.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

class LocalBookSourceImpl implements LocalBookSource {
  late BookDatabase _bookDatabase;
  LocalBookSourceImpl._() {
    _bookDatabase = BookDatabase();
  }

  static final LocalBookSourceImpl _instance = LocalBookSourceImpl._();

  factory LocalBookSourceImpl() => _instance;

  @override
  Future<List<Book>> retrieveBooks() async {
    return await _bookDatabase.retrieveCurrentItem();
  }
}
