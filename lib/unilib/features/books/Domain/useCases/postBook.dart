import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class PostBook implements Usecase<BookModel, PostBookParam> {
  BookRepository _bookRepository;
  PostBook(this._bookRepository);

  @override
  Future<Either<Failure, BookModel>> call(param) async {
    try {
      final _result = await _bookRepository.postBook(
        name: param.name,
        description: param.description,
        url: param.url,
        image: param.image,
      );

      return Right(_result);
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class PostBookParam {
  final String name;
  final String description;
  final String url;
  final String image;

  const PostBookParam({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
  });
}
