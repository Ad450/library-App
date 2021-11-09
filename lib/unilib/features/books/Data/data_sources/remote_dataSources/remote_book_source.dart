
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class RemoteBookSource {
 Future <List<BookModels>> call();
}


