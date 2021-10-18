import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class GetAllBooks implements UseCase<List, NoParam> {
   BooksRepository _booksRepository;

  GetAllBooks(this._booksRepository); 
  @override
  Future<List<Book>> call(NoParam type) async {
    return _booksRepository.retrieveAllBooks();
  }
}
