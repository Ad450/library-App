import 'package:library_project/unilib/core/Data/platforms/connectivity/connectivity_contract.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/remote_dataSources/remote_book_source.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';

class BooksRepositoryImpl implements BooksRepository {
  RemoteBookSource remoteBookSource;
  LocalBookSource localBookSource;
  NetworkInfo networkInfo;

  BooksRepositoryImpl(
      {required this.remoteBookSource,
      required this.localBookSource,
      required this.networkInfo});

  @override
  Future<bool> postBook(Book book) {
    // TODO: implement postBook
    throw UnimplementedError();
  }

  @override
  Future<List<BookModels>> retrieveAllBooks() async {
    NetworkStatus status = await networkInfo.call();
    if (status == NetworkStatus.mobile || status == NetworkStatus.Wifi) {
      return await remoteBookSource.call();
    } else {
      return await localBookSource.retrieveBooks();
    }
  }
}
