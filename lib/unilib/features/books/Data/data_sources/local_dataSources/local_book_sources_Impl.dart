import 'package:library_project/unilib/core/Data/database/db.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

class LocalBookSourceImpl implements LocalBookSource {
  BookDatabase _bookDatabase;
  LocalBookSourceImpl(this._bookDatabase);

  @override
  Future<List<Book>> retrieveBooks() async {
    return await _bookDatabase.retrieveCurrentItem();
  }
}
