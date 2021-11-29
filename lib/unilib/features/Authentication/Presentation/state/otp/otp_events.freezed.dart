// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'otp_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OtpEventTearOff {
  const _$OtpEventTearOff();

  _OtpEventpayload payload({required String code}) {
    return _OtpEventpayload(
      code: code,
    );
  }
}

/// @nodoc
const $OtpEvent = _$OtpEventTearOff();

/// @nodoc
mixin _$OtpEvent {
  String get code => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) payload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? payload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OtpEventpayload value) payload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OtpEventpayload value)? payload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpEventCopyWith<OtpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res> implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  final OtpEvent _value;
  // ignore: unused_field
  final $Res Function(OtpEvent) _then;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OtpEventpayloadCopyWith<$Res>
    implements $OtpEventCopyWith<$Res> {
  factory _$OtpEventpayloadCopyWith(
          _OtpEventpayload value, $Res Function(_OtpEventpayload) then) =
      __$OtpEventpayloadCopyWithImpl<$Res>;
  @override
  $Res call({String code});
}

/// @nodoc
class __$OtpEventpayloadCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$OtpEventpayloadCopyWith<$Res> {
  __$OtpEventpayloadCopyWithImpl(
      _OtpEventpayload _value, $Res Function(_OtpEventpayload) _then)
      : super(_value, (v) => _then(v as _OtpEventpayload));

  @override
  _OtpEventpayload get _value => super._value as _OtpEventpayload;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_OtpEventpayload(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OtpEventpayload implements _OtpEventpayload {
  _$_OtpEventpayload({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'OtpEvent.payload(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OtpEventpayload &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$OtpEventpayloadCopyWith<_OtpEventpayload> get copyWith =>
      __$OtpEventpayloadCopyWithImpl<_OtpEventpayload>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) payload,
  }) {
    return payload(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? payload,
    required TResult orElse(),
  }) {
    if (payload != null) {
      return payload(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OtpEventpayload value) payload,
  }) {
    return payload(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OtpEventpayload value)? payload,
    required TResult orElse(),
  }) {
    if (payload != null) {
      return payload(this);
    }
    return orElse();
  }
}

abstract class _OtpEventpayload implements OtpEvent {
  factory _OtpEventpayload({required String code}) = _$_OtpEventpayload;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OtpEventpayloadCopyWith<_OtpEventpayload> get copyWith =>
      throw _privateConstructorUsedError;
}
