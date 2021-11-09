import 'package:library_project/unilib/core/Data/database/db.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';

class LocalBookSourceImpl implements LocalBookSource {
  BookDatabase _bookDatabase;
  LocalBookSourceImpl(this._bookDatabase);

  @override
 Future<List<BookModels>>  retrieveBooks() async {
    return  await _bookDatabase.retrieveCurrentItem();
  }
}
