part of "book_cubit.dart";

@freezed
abstract class BookState with _$BookState {
  const factory BookState.initial({
    required String error,
    required BookModel? book,
  }) = _Initial;

  const factory BookState.error({
    required String error,
    required BookModel? book,
  }) = _Error;

  const factory BookState.loading({
    required String error,
    required BookModel? book,
  }) = _Loading;

  const factory BookState.booksLoaded({
    required String error,
    required BookModel? book,
  }) = _Loaded;

  const factory BookState.bookPosted({
    required String error,
    required BookModel? book,
  }) = _Loaded;
}
