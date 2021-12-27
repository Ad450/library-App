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

BookState _$BookStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'initial':
      return _Initial.fromJson(json);
    case 'error':
      return _Error.fromJson(json);
    case 'loading':
      return _Loading.fromJson(json);
    case 'loaded':
      return _Loaded.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'BookState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$BookStateTearOff {
  const _$BookStateTearOff();

  _Initial initial(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) {
    return _Initial(
      error: error,
      book: book,
      books: books,
    );
  }

  _Error error(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) {
    return _Error(
      error: error,
      book: book,
      books: books,
    );
  }

  _Loading loading(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) {
    return _Loading(
      error: error,
      book: book,
      books: books,
    );
  }

  _Loaded loaded(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) {
    return _Loaded(
      error: error,
      book: book,
      books: books,
    );
  }

  BookState fromJson(Map<String, Object> json) {
    return BookState.fromJson(json);
  }
}

/// @nodoc
const $BookState = _$BookStateTearOff();

/// @nodoc
mixin _$BookState {
  String get error => throw _privateConstructorUsedError;
  BookModel? get book => throw _privateConstructorUsedError;
  List<BookModel?> get books => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        initial,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        error,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loading,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookStateCopyWith<BookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookStateCopyWith<$Res> {
  factory $BookStateCopyWith(BookState value, $Res Function(BookState) then) =
      _$BookStateCopyWithImpl<$Res>;
  $Res call({String error, BookModel? book, List<BookModel?> books});

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
    Object? books = freezed,
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
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel?>,
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
  $Res call({String error, BookModel? book, List<BookModel?> books});

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
    Object? books = freezed,
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
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.error, required this.book, required this.books});

  factory _$_Initial.fromJson(Map<String, dynamic> json) =>
      _$$_InitialFromJson(json);

  @override
  final String error;
  @override
  final BookModel? book;
  @override
  final List<BookModel?> books;

  @override
  String toString() {
    return 'BookState.initial(error: $error, book: $book, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        initial,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        error,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loading,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loaded,
  }) {
    return initial(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
  }) {
    return initial?.call(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this.error, book, books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_InitialToJson(this)..['runtimeType'] = 'initial';
  }
}

abstract class _Initial implements BookState {
  const factory _Initial(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) = _$_Initial;

  factory _Initial.fromJson(Map<String, dynamic> json) = _$_Initial.fromJson;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  List<BookModel?> get books => throw _privateConstructorUsedError;
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
  $Res call({String error, BookModel? book, List<BookModel?> books});

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
    Object? books = freezed,
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
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Error implements _Error {
  const _$_Error(
      {required this.error, required this.book, required this.books});

  factory _$_Error.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorFromJson(json);

  @override
  final String error;
  @override
  final BookModel? book;
  @override
  final List<BookModel?> books;

  @override
  String toString() {
    return 'BookState.error(error: $error, book: $book, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        initial,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        error,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loading,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loaded,
  }) {
    return error(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
  }) {
    return error?.call(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, book, books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorToJson(this)..['runtimeType'] = 'error';
  }
}

abstract class _Error implements BookState {
  const factory _Error(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) = _$_Error;

  factory _Error.fromJson(Map<String, dynamic> json) = _$_Error.fromJson;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  List<BookModel?> get books => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book, List<BookModel?> books});

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
    Object? books = freezed,
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
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Loading implements _Loading {
  const _$_Loading(
      {required this.error, required this.book, required this.books});

  factory _$_Loading.fromJson(Map<String, dynamic> json) =>
      _$$_LoadingFromJson(json);

  @override
  final String error;
  @override
  final BookModel? book;
  @override
  final List<BookModel?> books;

  @override
  String toString() {
    return 'BookState.loading(error: $error, book: $book, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        initial,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        error,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loading,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loaded,
  }) {
    return loading(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
  }) {
    return loading?.call(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this.error, book, books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadingToJson(this)..['runtimeType'] = 'loading';
  }
}

abstract class _Loading implements BookState {
  const factory _Loading(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) = _$_Loading;

  factory _Loading.fromJson(Map<String, dynamic> json) = _$_Loading.fromJson;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  List<BookModel?> get books => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> implements $BookStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({String error, BookModel? book, List<BookModel?> books});

  @override
  $BookModelCopyWith<$Res>? get book;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$BookStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? error = freezed,
    Object? book = freezed,
    Object? books = freezed,
  }) {
    return _then(_Loaded(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookModel?,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required this.error, required this.book, required this.books});

  factory _$_Loaded.fromJson(Map<String, dynamic> json) =>
      _$$_LoadedFromJson(json);

  @override
  final String error;
  @override
  final BookModel? book;
  @override
  final List<BookModel?> books;

  @override
  String toString() {
    return 'BookState.loaded(error: $error, book: $book, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        initial,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        error,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loading,
    required TResult Function(
            String error, BookModel? book, List<BookModel?> books)
        loaded,
  }) {
    return loaded(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
  }) {
    return loaded?.call(this.error, book, books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        initial,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        error,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loading,
    TResult Function(String error, BookModel? book, List<BookModel?> books)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this.error, book, books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadedToJson(this)..['runtimeType'] = 'loaded';
  }
}

abstract class _Loaded implements BookState {
  const factory _Loaded(
      {required String error,
      required BookModel? book,
      required List<BookModel?> books}) = _$_Loaded;

  factory _Loaded.fromJson(Map<String, dynamic> json) = _$_Loaded.fromJson;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  BookModel? get book => throw _privateConstructorUsedError;
  @override
  List<BookModel?> get books => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}
