import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class BookRemoteDatasource {
  Future<BookModel> getBooks();
  Future<BookModel> postBook({
    required String name,
    required String description,
    required String url,
    required String image,
  });
}

class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  @override
  Future<BookModel> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<BookModel> postBook(
      {required String name, required String description, required String url, required String image}) {
    // TODO: implement postBook
    throw UnimplementedError();
  }
}
