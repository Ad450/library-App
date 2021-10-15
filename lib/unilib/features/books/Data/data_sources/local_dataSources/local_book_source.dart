import 'package:library_project/unilib/core/Data/cached_books.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_sources_impl.dart';

abstract class LocalBookSource {
  factory LocalBookSource() => LocalBookSourceImpl();
  Future<CachedBooks> retrieveBooks();
}
