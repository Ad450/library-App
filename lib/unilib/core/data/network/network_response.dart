import 'package:dio/dio.dart';
import 'package:library_project/unilib/core/failures.dart';

class NetworkResponse {
  // data contains the actual data expected from the server

  Map<String, dynamic> data;

  // error
  Failure error;

  // optional headers of response
  Map<String, dynamic>? headers;

  NetworkResult result;

  NetworkResponse(
      {required this.data,
      required this.error,
      this.headers,
      required this.result});
}

enum NetworkResult {
  SUCCESS,
  FAILURE,
  NO_INTERNET_CONNECTION,
  SERVER_ERROR,
  BAD_REQUEST,
  UNAUTHORISED,
  FORBIDDEN,
  NO_SUCH_ENDPOINT,
  METHOD_DISALLOWED,
  SERVER_TIMEOUT,
  TOO_MANY_REQUESTS,
  NOT_IMPLEMENTED,
  NOT_FOUND
}

NetworkResponse handleResponse(Response _response) {
  if (_response.statusCode.toString().startsWith("2")) {
    if ((_response.data as Map<String, dynamic>).containsKey("data")) {
      return NetworkResponse(
          data: _response.data as Map<String, dynamic>,
          error: ApiFailure(""),
          result: NetworkResult.SUCCESS);
    }

    return NetworkResponse(
        data: _response.data as Map<String, dynamic>,
        error: ApiFailure(""),
        result: NetworkResult.SUCCESS);
  }

  return handleResponse(_response);
}

// to be used in catch block where the Dioerror is passed here

NetworkResponse handleErrorResponse(DioError error) {
  if (error.type == DioErrorType.connectTimeout ||
      error.type == DioErrorType.sendTimeout ||
      error.type == DioErrorType.receiveTimeout) {
    return NetworkResponse(
        data: {
          "message": "something bad happened",
          "error": "connetion time out. try again"
        },
        result: NetworkResult.SERVER_TIMEOUT,
        error: ApiFailure("connection time out"));
  }

  if (error.type == DioErrorType.response) {
    if (error.response == null) {
      return NetworkResponse(
          data: {
            "message": "something bad happened",
            "error": "no response from server"
          },
          result: NetworkResult.BAD_REQUEST,
          error: ApiFailure("no response from server"));
    }

    return _switchStatus(error.response!);
  }

  if (error.type == DioErrorType.cancel) {
    return NetworkResponse(
        data: {"message": "something bad happened", "error": "cancelled"},
        result: NetworkResult.METHOD_DISALLOWED,
        error: ApiFailure("couldn not perform operation"));
  }

  // this return will take care of DioErrorType.other
  return NetworkResponse(data: {
    "message": "something bad happened",
    "error": "connetion time out"
  }, result: NetworkResult.FAILURE, error: ApiFailure("please try again"));
}

_switchStatus(Response _response) {
  switch (_response.statusCode) {
    case 400:
      return NetworkResponse(
          data: {
            "message": "something bad happened",
            "error": "connetion time out"
          },
          result: NetworkResult.FAILURE,
          error: ApiFailure("not authorised to carry this operation"));
    case 404:
      return NetworkResponse(data: {
        "message": "something bad happened",
        "error": "connetion time out"
      }, result: NetworkResult.NOT_FOUND, error: ApiFailure(" not foundx="));
    case 500:
      return NetworkResponse(data: {
        "message": "something bad happened",
        "error": "connetion time out"
      }, result: NetworkResult.SERVER_ERROR, error: ApiFailure("server error"));

    default:
      return NetworkResponse(data: {
        "message": "something bad happened",
        "error": "connetion time out"
      }, result: NetworkResult.FAILURE, error: ApiFailure("failure"));
  }
}
