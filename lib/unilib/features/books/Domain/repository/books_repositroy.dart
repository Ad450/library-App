import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBooks();
  Future<BookModel> getBook(String uid);
  Future<BookModel> postBook({
    required String name,
    required String description,
    required String url,
    required String image,
  });
}
