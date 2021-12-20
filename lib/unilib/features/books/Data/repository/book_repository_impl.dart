import 'package:library_project/unilib/core/utils/guarded_api_calls.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/book_remote_datasource.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class BookRepositoryImpl implements BookRepository {
  BookRemoteDatasource _bookRemoteDatasource;
  BookRepositoryImpl(this._bookRemoteDatasource);

  @override
  Future<BookModel> getBooks() async {
    return await guardedApiCall<BookModel>(
      () => _bookRemoteDatasource.getBooks(),
    );
  }

  @override
  Future<BookModel> postBook(
      {required String name, required String description, required String url, required String image}) async {
    return await guardedApiCall(
      () => _bookRemoteDatasource.postBook(
        name: name,
        description: description,
        url: url,
        image: image,
      ),
    );
  }
}
