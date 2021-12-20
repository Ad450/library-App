import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class GetBooks implements Usecase<BookModel, NoParam> {
  BookRepository _bookRepository;
  GetBooks(this._bookRepository);

  @override
  Future<Either<Failure, BookModel>> call(param) async {
    try {
      final _result = await _bookRepository.getBooks();
      return Right(_result);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromNetworkFailure(e, s));
    }
  }
}
