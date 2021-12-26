import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class GetBook implements Usecase<BookModel, GetBookParam> {
  BookRepository _bookRepository;
  GetBook(this._bookRepository);
  @override
  Future<Either<Failure, BookModel>> call(param) async {
    try {
      final _result = await _bookRepository.getBook(param.uid);
      return Right(_result);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}

class GetBookParam {
  final String uid;
  const GetBookParam(this.uid);
}
