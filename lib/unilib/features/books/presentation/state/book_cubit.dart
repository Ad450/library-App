import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/getBooks.dart';
import 'package:library_project/unilib/features/books/Domain/useCases/postBook.dart';

part 'book_state.dart';
part 'book_cubit.freezed.dart';

class BookCubit extends HydratedCubit<BookState> {
  GetBooks _getBooks;
  PostBook _postBook;
  BookCubit(this._getBooks, this._postBook) : super(BookState.initial(error: "", book: null, books: <BookModel>[]));

  Future<void> getBooks() async {
    emit(BookState.loading(error: state.error, book: state.book, books: state.books));
    final _result = await _getBooks.call(NoParam());

    _result.fold(
      (l) => emit(BookState.error(error: l.message, book: state.book, books: state.books)),
      (r) => emit(
        BookState.loaded(error: state.error, book: state.book, books: r),
      ),
    );
  }

  Future<void> postBook({
    required String image,
    required String name,
    required String url,
    required String description,
  }) async {
    emit(BookState.loading(error: state.error, book: state.book, books: state.books));

    final _result = await _postBook.call(
      PostBookParam(
        image: image,
        name: name,
        description: description,
        url: url,
      ),
    );

    _result.fold(
      (l) => emit(BookState.error(error: l.message, book: state.book, books: state.books)),
      (r) => emit(BookState.loaded(error: state.error, book: state.book, books: state.books)),
    );
  }

  @override
  BookState? fromJson(Map<String, dynamic> json) {
    try {
      final _restoredBook = BookModel.fromJson(json);
      state.books.add(_restoredBook);
      return BookState.loaded(error: state.error, book: _restoredBook, books: state.books);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(BookState state) {
    if (state.books.length != 0) {
      //return Book
    }
  }
}
