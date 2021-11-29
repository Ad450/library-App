import 'package:library_project/unilib/core/Data/network/network_result.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';

class NetworkResponse {
  num? statusCode;

  NetworkResult result;

  dynamic data;

  dynamic failure;

  NetworkResponse(
      {required this.data,
      required this.result,
      this.statusCode,
      this.failure});
}
