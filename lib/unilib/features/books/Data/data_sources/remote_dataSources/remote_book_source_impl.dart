import 'dart:convert';

import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/remote_dataSources/remote_book_source.dart';
import 'package:http/http.dart' as http;

class RemoteBookSourceImpl implements RemoteBookSource {
  // RemoteBookSourceImpl._();

  // static final RemoteBookSourceImpl _instance = RemoteBookSourceImpl._();

  // factory RemoteBookSourceImpl() => _instance;

  @override
  Future<Either<Failure, List<BookModels>>> call() async {
    String endpoint =
        "https://uenrlibrary.herokuapp.com/api/library/retrieve-all-books";

    /// url goes in here
    Uri _uri = Uri.parse(endpoint);

    try {
      var _response =
          await http.get(_uri, headers: {"content-type": "application/json"});
      if (_response.statusCode.toString().startsWith("2")) {
        //  BookModels.fromJson(jsonDecode(_response.body));
        List _listfromJson = jsonDecode(_response.body);
        return Right(_listfromJson.map((element) {
          return BookModels.fromJson(element);
        }).toList());
      }
    } on Error catch (e) {
      throw (e);
    }

    return Left(Failure("error occured"));
  }
}
