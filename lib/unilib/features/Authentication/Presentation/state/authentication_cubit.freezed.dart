// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  _Initial initial({required String error, required UserModel? user}) {
    return _Initial(
      error: error,
      user: user,
    );
  }

  _LoggedIn loggedIn({required String error, required UserModel? user}) {
    return _LoggedIn(
      error: error,
      user: user,
    );
  }

  _Loading loading({required String error, required UserModel? user}) {
    return _Loading(
      error: error,
      user: user,
    );
  }

  _Error error({required String error, required UserModel? user}) {
    return _Error(
      error: error,
      user: user,
    );
  }

  _Loaded loaded({required String error, required UserModel? user}) {
    return _Loaded(
      error: error,
      user: user,
    );
  }

  _LoggedOut loggedOut({required String error, required UserModel? user}) {
    return _LoggedOut(
      error: error,
      user: user,
    );
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  String get error => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call({String error, UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_Initial(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.initial(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return initial(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return initial?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial({required String error, required UserModel? user}) =
      _$_Initial;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoggedInCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) then) =
      __$LoggedInCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoggedInCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(_LoggedIn _value, $Res Function(_LoggedIn) _then)
      : super(_value, (v) => _then(v as _LoggedIn));

  @override
  _LoggedIn get _value => super._value as _LoggedIn;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_LoggedIn(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_LoggedIn implements _LoggedIn {
  const _$_LoggedIn({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.loggedIn(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggedIn &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      __$LoggedInCopyWithImpl<_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return loggedIn(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return loggedIn?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements AuthenticationState {
  const factory _LoggedIn({required String error, required UserModel? user}) =
      _$_LoggedIn;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_Loading(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.loading(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return loading(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return loading?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthenticationState {
  const factory _Loading({required String error, required UserModel? user}) =
      _$_Loading;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_Error(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.error(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return error(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return error?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthenticationState {
  const factory _Error({required String error, required UserModel? user}) =
      _$_Error;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_Loaded(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.loaded(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return loaded(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return loaded?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthenticationState {
  const factory _Loaded({required String error, required UserModel? user}) =
      _$_Loaded;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoggedOutCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$LoggedOutCopyWith(
          _LoggedOut value, $Res Function(_LoggedOut) then) =
      __$LoggedOutCopyWithImpl<$Res>;
  @override
  $Res call({String error, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoggedOutCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$LoggedOutCopyWith<$Res> {
  __$LoggedOutCopyWithImpl(_LoggedOut _value, $Res Function(_LoggedOut) _then)
      : super(_value, (v) => _then(v as _LoggedOut));

  @override
  _LoggedOut get _value => super._value as _LoggedOut;

  @override
  $Res call({
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_LoggedOut(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_LoggedOut implements _LoggedOut {
  const _$_LoggedOut({required this.error, required this.user});

  @override
  final String error;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState.loggedOut(error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggedOut &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$LoggedOutCopyWith<_LoggedOut> get copyWith =>
      __$LoggedOutCopyWithImpl<_LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error, UserModel? user) initial,
    required TResult Function(String error, UserModel? user) loggedIn,
    required TResult Function(String error, UserModel? user) loading,
    required TResult Function(String error, UserModel? user) error,
    required TResult Function(String error, UserModel? user) loaded,
    required TResult Function(String error, UserModel? user) loggedOut,
  }) {
    return loggedOut(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
  }) {
    return loggedOut?.call(this.error, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error, UserModel? user)? initial,
    TResult Function(String error, UserModel? user)? loggedIn,
    TResult Function(String error, UserModel? user)? loading,
    TResult Function(String error, UserModel? user)? error,
    TResult Function(String error, UserModel? user)? loaded,
    TResult Function(String error, UserModel? user)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this.error, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoggedOut value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthenticationState {
  const factory _LoggedOut({required String error, required UserModel? user}) =
      _$_LoggedOut;

  @override
  String get error => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoggedOutCopyWith<_LoggedOut> get copyWith =>
      throw _privateConstructorUsedError;
}
