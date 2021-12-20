import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class BookRepository {
  Future<BookModel> getBooks();
  Future<BookModel> postBook({
    required String name,
    required String description,
    required String url,
    required String image,
  });
}
