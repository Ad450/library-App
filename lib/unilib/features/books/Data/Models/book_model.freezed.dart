// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookModelTearOff {
  const _$BookModelTearOff();

  _BookModel call(
      {required String name,
      required String url,
      required String description,
      required String image}) {
    return _BookModel(
      name: name,
      url: url,
      description: description,
      image: image,
    );
  }
}

/// @nodoc
const $BookModel = _$BookModelTearOff();

/// @nodoc
mixin _$BookModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res>;
  $Res call({String name, String url, String description, String image});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res> implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  final BookModel _value;
  // ignore: unused_field
  final $Res Function(BookModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$BookModelCopyWith(
          _BookModel value, $Res Function(_BookModel) then) =
      __$BookModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url, String description, String image});
}

/// @nodoc
class __$BookModelCopyWithImpl<$Res> extends _$BookModelCopyWithImpl<$Res>
    implements _$BookModelCopyWith<$Res> {
  __$BookModelCopyWithImpl(_BookModel _value, $Res Function(_BookModel) _then)
      : super(_value, (v) => _then(v as _BookModel));

  @override
  _BookModel get _value => super._value as _BookModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_BookModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BookModel implements _BookModel {
  _$_BookModel(
      {required this.name,
      required this.url,
      required this.description,
      required this.image});

  @override
  final String name;
  @override
  final String url;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'BookModel(name: $name, url: $url, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$BookModelCopyWith<_BookModel> get copyWith =>
      __$BookModelCopyWithImpl<_BookModel>(this, _$identity);
}

abstract class _BookModel implements BookModel {
  factory _BookModel(
      {required String name,
      required String url,
      required String description,
      required String image}) = _$_BookModel;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookModelCopyWith<_BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}
