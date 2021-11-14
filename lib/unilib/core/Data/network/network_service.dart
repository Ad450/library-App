import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:library_project/unilib/core/Data/network/network_response.dart';
import 'package:library_project/unilib/core/Data/network/network_result.dart';
import 'package:library_project/unilib/core/exceptions/failures.dart';

abstract class NetworkService {
  Future<NetworkResponse> post(
      {required dynamic url,
      Map<String, String>? headers,
      required Map<String, dynamic> body});

  Future<NetworkResponse> get({required dynamic url});
}

class NetworkServiceImpl implements NetworkService {
  @override
  Future<NetworkResponse> post(
      {required url,
      Map<String, String>? headers,
      required Map<String, dynamic> body}) async {
    var _response;
    try {
      print("function execution in network service implementation");
      _response = await http.post(Uri.parse(url),
          headers: headers ?? {"content-type": "application/json"},
          body: jsonEncode(body));

      if (_response.statusCode.toString().startsWith('2')) {
        return NetworkResponse(
            data: jsonDecode(_response.body),
            result: NetworkResult.SUCESS,
            statusCode: _response.statusCode);
      }

      if (_response.statusCode.toString().startsWith('3')) {
        return NetworkResponse(
            result: NetworkResult.REDIRECT,
            data: null,
            statusCode: _response.statusCode);
      }
      if (_response.statusCode.toString().startsWith('4')) {
        return NetworkResponse(
            result: NetworkResult.UNAUTHORISED,
            data: null,
            statusCode: _response.statusCode);
      }

      if (_response.statusCode.toString().startsWith('5')) {
        return NetworkResponse(
            result: NetworkResult.INTERNAL_SERVER_ERROR,
            data: null,
            statusCode: _response.statusCode);
      }
    } on SocketException catch (e) {
      return NetworkResponse(
          data: null,
          result: NetworkResult.FAILURE,
          failure:
              Failure("please check your internet connectivity"));
    }

    return NetworkResponse(
        result: NetworkResult.FAILURE,
        data: null,
        statusCode: _response.statusCode);
  }

  @override
  Future<NetworkResponse> get({required url}) async {
    var _response;

    try {
      _response = await http.get(Uri.parse(url), headers: {"content-type":"application/json"});

      if (_response.statusCode.toString().startsWith('2')) {
        return NetworkResponse(
            data: jsonDecode(_response.body),
            result: NetworkResult.SUCESS,
            statusCode: _response.statusCode);
      }

      if (_response.statusCode.toString().startsWith('3')) {
        return NetworkResponse(
            result: NetworkResult.REDIRECT,
            data: null,
            statusCode: _response.statusCode);
      }
      if (_response.statusCode.toString().startsWith('4')) {
        return NetworkResponse(
            result: NetworkResult.UNAUTHORISED,
            data: null,
            statusCode: _response.statusCode);
      }

      if (_response.statusCode.toString().startsWith('5')) {
        return NetworkResponse(
            result: NetworkResult.INTERNAL_SERVER_ERROR,
            data: null,
            statusCode: _response.statusCode);
      }
    } on SocketException catch (e) {
      return NetworkResponse(
          data: null,
          result: NetworkResult.FAILURE,
          failure:
              Failure("network error occured, please internet connectivity"));
    }

    return NetworkResponse(
        result: NetworkResult.FAILURE,
        data: null,
        statusCode: _response.statusCode);
  }
}
