import 'package:library_project/unilib/features/books/Domain/entities/books.dart';

class BookModels extends Book {
  BookModels(
      {required String name,
      required String description,
      required int id,
      required String img})
      : super(name: name, description: description, img: img);

  factory BookModels.fromJson(Map<String, dynamic> bookMap) {
    return BookModels(
        name: bookMap["name"],
        description: bookMap["description"],
        img: bookMap["img"],
        id: bookMap["id"]);
  }
}
