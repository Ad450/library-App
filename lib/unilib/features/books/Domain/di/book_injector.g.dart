// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$BookInjector extends BookInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => GetBooks(c<BookRepository>()))
      ..registerSingleton((c) => PostBook(c<BookRepository>()))
      ..registerFactory<BookRepositoryImpl>(
          (c) => BookRepositoryImpl(c<BookRemoteDatasource>()))
      ..registerFactory<BookRemoteDatasource>(
          (c) => BookRemoteDatasourceImpl());
  }
}
