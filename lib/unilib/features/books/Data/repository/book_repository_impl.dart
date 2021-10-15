import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class BooksRepositoryImpl implements BooksRepository {
  BooksRepositoryImpl._();

  static final BooksRepositoryImpl _instance = BooksRepositoryImpl._();

  factory BooksRepositoryImpl() => _instance;

  @override
  Future<bool> downloadBook(Book book) async {
    // TODO: implement postBook
    throw UnimplementedError();
  }

  @override
  Future<bool> postBook(Book book) {
    // TODO: implement postBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> retrieveAllBooks() {
    // TODO: implement retrieveAllBooks
    throw UnimplementedError();
  }
}
