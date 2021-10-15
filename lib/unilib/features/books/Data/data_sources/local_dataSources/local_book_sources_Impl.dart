import 'package:library_project/unilib/core/Data/cached_books.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_source.dart';

class LocalBookSourceImpl implements LocalBookSource {
  LocalBookSourceImpl._();

  static final LocalBookSourceImpl _instance = LocalBookSourceImpl._();

  factory LocalBookSourceImpl() => _instance;

  @override
  Future<CachedBooks> retrieveBooks() {
    // TODO: implement retrieveBooks
    throw UnimplementedError();
  }
}
