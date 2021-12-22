import 'package:flutter/painting.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/books/Data/Models/book_model.dart';

abstract class BookRemoteDatasource {
  Future<List<BookModel>> getBooks();
  Future<BookModel> getBook(String uid);
  Future<BookModel> postBook({
    required String name,
    required String description,
    required String url,
    required String image,
  });
}

class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  NetworkService _networkService;
  BookRemoteDatasourceImpl(this._networkService);

  @override
  Future<List<BookModel>> getBooks() async {
    final _response = await _networkService.get(url: "library/retrieve-all-books");
    if (_response.result == NetworkResult.SUCCESS) {
      return (_response.data["data"] as List).map((e) => BookModel.fromJson(e)).toList();
    }

    throw ApiFailure(_response.error.message);
  }

  @override
  Future<BookModel> postBook(
      {required String name, required String description, required String url, required String image}) async {
    final _response = await _networkService.post(
        url: "library/post-books", body: {"title": name, "book_file": url, "image": image, "category": description});
    if (_response.result == NetworkResult.SUCCESS) {
      return BookModel.fromJson(_response.data["data"] as Map<String, dynamic>);
    }

    throw ApiFailure(_response.error.message);
  }

  @override
  Future<BookModel> getBook(String uid) {
    // TODO: implement getBook
    throw UnimplementedError();
  }
}
