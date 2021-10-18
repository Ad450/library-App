import 'package:library_project/unilib/features/books/Data/data_sources/remote_dataSources/remote_book_source_impl.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

abstract class RemoteBookSource {
  Future<List<Book>> call();
}
