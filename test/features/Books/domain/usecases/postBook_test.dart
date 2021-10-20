
import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/features/books/Domain/entities/books.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/postBook.dart';
import 'package:mockito/mockito.dart';

import 'retrieveAllbooks_test.mocks.dart';

void main(){
  test("should return a boolean ", ()async{
    //arrange
      Book tBook = Book(name: "book_name", description: "description", img : "image");
      MockBooksRepository mockBooksRepository = MockBooksRepository();
      PostBook postBook = PostBook(mockBooksRepository);

      when(mockBooksRepository.postBook(tBook)).thenAnswer((_)async => true);
    // act  

      bool result = await postBook.call(tBook);

    // assert
      expect(result, true);

  });
}