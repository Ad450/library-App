
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class BooksRepository {
  Future<bool> postBook(Book book);
  Future<Either<Failure, List<BookModels>>>  retrieveAllBooks();
}

