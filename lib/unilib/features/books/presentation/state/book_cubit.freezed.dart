// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookStateTearOff {
  const _$BookStateTearOff();

  _Initial initial({required String error, required BookModel? book}) {
    return _Initial(
      error: error,
      book: book,
    );
  }

  _Error error({required String error, required BookModel? book}) {
    return _Error(
      error: error,
      book: book,
    );
  }

  _Loading loading({required String error, required BookModel? book}) {
    return _Loading(
      error: error,
      book: book,
    );
  }

  _BooksLoaded booksLoaded({required String error, required BookModel? book}) {
    return _BooksLoaded(
      error: error,
      book: book,
    );
  }

  _BookPosted bookPosted({required String error, required BookModel? book}) {
    return _BookPosted(
      error: error,
      book: book,
    );
  }
}

/// @nodoc
const $BookState = _$BookStateTearOff();

/// @nodoc
mixin _$BookState {
  String get error => throw _privateConstructorUsedError;
  BookModel? get book => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookStateCopyWith<BookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookStateCopyWith<$Res> {
  factory $BookStateCopyWith(BookState value, $Res Function(BookState) then) =
      _$BookStateCopyWithImpl<$Res>;
  $Res call({String error, BookModel? book});

  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class _$BookStateCopyWithImpl<$Res> implements $BookStateCopyWith<$Res> {
  _$BookStateCopyWithImpl(this._value, this._then);

  final BookState _value;
  // ignore: unused_field
  final $Res Function(BookState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }

  @override
  $BookModelCopyWith<$Res>? get book {
    if (_value.book == null) {
      return null;
    }

    return $BookModelCopyWith<$Res>(_value.book!, (value) {
      return _then(_value.copyWith(book: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_Initial(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.error, required this.book});

  @override
  final String error;
  @override
  final BookModel? book;

  @override
  String toString() {
    return 'BookState.initial(error: $error, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) {
    return initial(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) {
    return initial?.call(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this.error, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BookState {
  const factory _Initial({required String error, required BookModel? book}) =
      _$_Initial;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_Error(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.error, required this.book});

  @override
  final String error;
  @override
  final BookModel? book;

  @override
  String toString() {
    return 'BookState.error(error: $error, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) {
    return error(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) {
    return error?.call(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BookState {
  const factory _Error({required String error, required BookModel? book}) =
      _$_Error;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_Loading(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.error, required this.book});

  @override
  final String error;
  @override
  final BookModel? book;

  @override
  String toString() {
    return 'BookState.loading(error: $error, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) {
    return loading(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) {
    return loading?.call(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this.error, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BookState {
  const factory _Loading({required String error, required BookModel? book}) =
      _$_Loading;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BooksLoadedCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$BooksLoadedCopyWith(
          _BooksLoaded value, $Res Function(_BooksLoaded) then) =
      __$BooksLoadedCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$BooksLoadedCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$BooksLoadedCopyWith<$Res> {
  __$BooksLoadedCopyWithImpl(
      _BooksLoaded _value, $Res Function(_BooksLoaded) _then)
      : super(_value, (v) => _then(v as _BooksLoaded));

  @override
  _BooksLoaded get _value => super._value as _BooksLoaded;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_BooksLoaded(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }
}

/// @nodoc

class _$_BooksLoaded implements _BooksLoaded {
  const _$_BooksLoaded({required this.error, required this.book});

  @override
  final String error;
  @override
  final BookModel? book;

  @override
  String toString() {
    return 'BookState.booksLoaded(error: $error, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BooksLoaded &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book);

  @JsonKey(ignore: true)
  @override
  _$BooksLoadedCopyWith<_BooksLoaded> get copyWith =>
      __$BooksLoadedCopyWithImpl<_BooksLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) {
    return booksLoaded(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) {
    return booksLoaded?.call(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(this.error, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) {
    return booksLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) {
    return booksLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(this);
    }
    return orElse();
  }
}

abstract class _BooksLoaded implements BookState {
  const factory _BooksLoaded(
      {required String error, required BookModel? book}) = _$_BooksLoaded;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BooksLoadedCopyWith<_BooksLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BookPostedCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$BookPostedCopyWith(
          _BookPosted value, $Res Function(_BookPosted) then) =
      __$BookPostedCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$BookPostedCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$BookPostedCopyWith<$Res> {
  __$BookPostedCopyWithImpl(
      _BookPosted _value, $Res Function(_BookPosted) _then)
      : super(_value, (v) => _then(v as _BookPosted));

  @override
  _BookPosted get _value => super._value as _BookPosted;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
  }) {
    return _then(_BookPosted(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
    ));
  }
}

/// @nodoc

class _$_BookPosted implements _BookPosted {
  const _$_BookPosted({required this.error, required this.book});

  @override
  final String error;
  @override
  final BookModel? book;

  @override
  String toString() {
    return 'BookState.bookPosted(error: $error, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookPosted &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book);

  @JsonKey(ignore: true)
  @override
  _$BookPostedCopyWith<_BookPosted> get copyWith =>
      __$BookPostedCopyWithImpl<_BookPosted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, BookModel? book) initial,
    required TResult Function(String error, BookModel? book) error,
    required TResult Function(String error, BookModel? book) loading,
    required TResult Function(String error, BookModel? book) booksLoaded,
    required TResult Function(String error, BookModel? book) bookPosted,
  }) {
    return bookPosted(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
  }) {
    return bookPosted?.call(this.error, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book)? initial,
    TResult Function(String error, BookModel? book)? error,
    TResult Function(String error, BookModel? book)? loading,
    TResult Function(String error, BookModel? book)? booksLoaded,
    TResult Function(String error, BookModel? book)? bookPosted,
    required TResult orElse(),
  }) {
    if (bookPosted != null) {
      return bookPosted(this.error, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_BookPosted value) bookPosted,
  }) {
    return bookPosted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
  }) {
    return bookPosted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_BookPosted value)? bookPosted,
    required TResult orElse(),
  }) {
    if (bookPosted != null) {
      return bookPosted(this);
    }
    return orElse();
  }
}

abstract class _BookPosted implements BookState {
  const factory _BookPosted({required String error, required BookModel? book}) =
      _$_BookPosted;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookPostedCopyWith<_BookPosted> get copyWith =>
      throw _privateConstructorUsedError;
}
