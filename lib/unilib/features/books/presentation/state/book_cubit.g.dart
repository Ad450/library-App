// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => _$_Initial(
      error: json['error'] as String,
      book: json['book'] == null
          ? null
          : BookModel.fromJson(json['book'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) =>
              e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'error': instance.error,
      'book': instance.book,
      'books': instance.books,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      error: json['error'] as String,
      book: json['book'] == null
          ? null
          : BookModel.fromJson(json['book'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) =>
              e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'error': instance.error,
      'book': instance.book,
      'books': instance.books,
    };

_$_Loading _$$_LoadingFromJson(Map<String, dynamic> json) => _$_Loading(
      error: json['error'] as String,
      book: json['book'] == null
          ? null
          : BookModel.fromJson(json['book'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) =>
              e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LoadingToJson(_$_Loading instance) =>
    <String, dynamic>{
      'error': instance.error,
      'book': instance.book,
      'books': instance.books,
    };

_$_Loaded _$$_LoadedFromJson(Map<String, dynamic> json) => _$_Loaded(
      error: json['error'] as String,
      book: json['book'] == null
          ? null
          : BookModel.fromJson(json['book'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) =>
              e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LoadedToJson(_$_Loaded instance) => <String, dynamic>{
      'error': instance.error,
      'book': instance.book,
      'books': instance.books,
    };
