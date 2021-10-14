import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class BooksRepository {
  Future<bool> postBook(Book book);
  Future<bool> retrieveAllBooks();
  Future<bool> downloadBook(Book book);
}

