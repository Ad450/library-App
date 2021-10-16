import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class DownloadBook implements UseCase<bool, Book> {
  BooksRepository _booksRepository = BooksRepository();

  @override
  Future<bool> call(Book book) async {
    return await _booksRepository.downloadBook(book);
  }
}
