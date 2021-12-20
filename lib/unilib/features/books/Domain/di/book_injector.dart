import 'package:kiwi/kiwi.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/book_remote_datasource.dart';
import 'package:library_project/unilib/features/books/Data/repository/book_repository_impl.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/getBooks.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/postBook.dart';

part 'book_injector.g.dart';

abstract class BookInjector {
  static late KiwiContainer _container;

  static final resolve = _container.resolve;

  void setUp() {
    _container = KiwiContainer();

    _$BookInjector()._configure();
  }

  @Register.singleton(GetBooks)
  @Register.singleton(PostBook)
  @Register.factory(BookRepositoryImpl, from: BookRepositoryImpl)
  @Register.factory(BookRemoteDatasource, from: BookRemoteDatasourceImpl)
  void _configure();
}
