// statement
// the getAllBooks usecase retrieve all Books from the book repository
// the books repository will fetch books from an external source which cannot
// be trusted
// so we will mock(simulate) the repository and provide a consistent value
// to our usecase to be able to test out the functionality

import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/retrieveAllBooks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'retrieveAllbooks_test.mocks.dart';


@GenerateMocks([BooksRepository])
void main() {
  test("should return a list of books", () async {
    // arrange
    NoParam noParam = NoParam();
    List<Book> testList = <Book>[
      Book(name: "hey", img: "img", description: "test")
    ];
    MockBooksRepository mockBookRepository = MockBooksRepository();
    GetAllBooks getAllBooks = GetAllBooks(mockBookRepository);

    when(mockBookRepository.retrieveAllBooks())
        .thenAnswer((_) async => testList);

    // act
    List<Book> resultFromSUT = await getAllBooks.call(noParam);

    // assert
    expect(resultFromSUT, testList);
  });
}
