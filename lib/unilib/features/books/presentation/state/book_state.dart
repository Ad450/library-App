part of "book_cubit.dart";

@freezed
abstract class BookState with _$BookState {
  const factory BookState.initial({
    required String error,
    required BookModel? book,
    required List<BookModel?> books,
  }) = _Initial;

  const factory BookState.error({
    required String error,
    required BookModel? book,
    required List<BookModel?> books,
  }) = _Error;

  const factory BookState.loading({
    required String error,
    required BookModel? book,
    required List<BookModel?> books,
  }) = _Loading;

  const factory BookState.loaded({
    required String error,
    required BookModel? book,
    required List<BookModel?> books,
  }) = _Loaded;
}
