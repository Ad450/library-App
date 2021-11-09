
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class LocalBookSource {
  Future<List<BookModels>> retrieveBooks();
}
