import 'package:library_project/unilib/features/books/Data/repository/book_repository_impl.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class BooksRepository {
  factory BooksRepository()=> BooksRepositoryImpl();
  Future<bool> postBook(Book book);
  Future<List<Book>> retrieveAllBooks();
  Future<bool> downloadBook(Book book);
}

