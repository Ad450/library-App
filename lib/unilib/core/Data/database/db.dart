
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class BookDatabase {
  void store(BookModels _book);
  Future<List<Book>> retrieveCurrentItem();
}
