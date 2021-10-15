
import 'package:library_project/unilib/features/books/Data/data_sources/local_dataSources/local_book_sources_impl.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class LocalBookSource {
  factory LocalBookSource() => LocalBookSourceImpl();
  Future<List<Book>> retrieveBooks();
}
