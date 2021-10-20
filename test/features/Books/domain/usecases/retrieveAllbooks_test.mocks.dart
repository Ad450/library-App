// Mocks generated by Mockito 5.0.15 from annotations
// in library_project/test/features/Books/domain/usecases/retrieveAllbooks_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:library_project/unilib/features/books/Domain/entities/books.dart'
    as _i4;
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [BooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepository extends _i1.Mock implements _i2.BooksRepository {
  MockBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> postBook(_i4.Book? book) =>
      (super.noSuchMethod(Invocation.method(#postBook, [book]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.Book>> retrieveAllBooks() =>
      (super.noSuchMethod(Invocation.method(#retrieveAllBooks, []),
              returnValue: Future<List<_i4.Book>>.value(<_i4.Book>[]))
          as _i3.Future<List<_i4.Book>>);
  @override
  String toString() => super.toString();
}