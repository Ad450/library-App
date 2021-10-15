
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

class LocalBookSourceImpl implements LocalBookSource {
  LocalBookSourceImpl._();

  static final LocalBookSourceImpl _instance = LocalBookSourceImpl._();

  factory LocalBookSourceImpl() => _instance;

  @override
  Future<List<Book>> retrieveBooks() {
    // TODO: implement retrieveBooks
    throw UnimplementedError();
  }
}
