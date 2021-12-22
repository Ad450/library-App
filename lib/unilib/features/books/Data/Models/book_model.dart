import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

//TODO: ask Manuel about the namings of the BookModel properties

@freezed
abstract class BookModel with _$BookModel {
  factory BookModel({required String name, required String url, required String description, required String image}) =
      _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
