
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class RemoteBookSource {
 Future <Either <Failure, List<BookModels>>> call();
}


