import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/getBooks.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/postBook.dart';

part 'book_state.dart';
part 'book_cubit.freezed.dart';

class BookCubit extends Cubit<BookState> {
  GetBooks _getBooks;
  PostBook _postBook;
  BookCubit(this._getBooks, this._postBook) : super(BookState.initial(error: "", book: null));

  Future<void> getBooks() async {
    emit(BookState.loading(error: state.error, book: state.book));
    final _result = await _getBooks.call(NoParam());

    _result.fold(
      (l) => emit(BookState.error(error: l.message, book: state.book)),
      (r) => emit(
        BookState.booksLoaded(error: state.error, book: r),
      ),
    );
  }

  Future<void> postBook({
    required String image,
    required String name,
    required String url,
    required String description,
  }) async {
    emit(BookState.loading(error: state.error, book: state.book));

    final _result = await _postBook.call(
      PostBookParam(
        image: image,
        name: name,
        description: description,
        url: url,
      ),
    );

    _result.fold(
      (l) => emit(BookState.error(error: l.message, book: state.book)),
      (r) => emit(BookState.bookPosted(error: state.error, book: r)),
    );
  }
}
