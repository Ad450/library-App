import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class BookDatabase {
  Future<void> store(BookModels _book);
  Future<List<BookModels>> retrieveCurrentItem();
  Future<void> delete(BookModels _book, dynamic id, String table);
}
