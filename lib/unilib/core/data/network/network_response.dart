import 'package:dio/dio.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/app_strings.dart';

class NetworkResponse {
  // data contains the actual data expected from the server

  Map<String, dynamic> data;

  // error
  Failure? error;

  // optional headers of response
  Map<String, dynamic>? headers;

  NetworkResult result;

  NetworkResponse({required this.data, this.error, this.headers, required this.result});
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
        data: _response.data['data'] as Map<String, dynamic>,
        result: NetworkResult.SUCCESS,
      );
    }

    return NetworkResponse(
      data: <String, dynamic>{'data': _response.data},
      result: NetworkResult.SUCCESS,
    );
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
        "message": AppStrings.apiErrors[ApiErrors.apiConnectionTimeout],
        "error": ApiErrors.apiConnectionTimeout,
      },
      result: NetworkResult.SERVER_TIMEOUT,
      error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiConnectionTimeout]!),
    );
  }

  if (error.type == DioErrorType.response) {
    if (error.response == null) {
      return NetworkResponse(
        data: {
          "message": AppStrings.apiErrors[ApiErrors.apiNoResponse],
          "error": ApiErrors.apiNoResponse,
        },
        result: NetworkResult.NOT_FOUND,
        error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiNoResponse]!),
      );
    }

    return _switchStatus(error.response!);
  }

  if (error.type == DioErrorType.cancel) {
    return NetworkResponse(
      data: {
        "message": AppStrings.apiErrors[ApiErrors.apiUnknown],
        "error": ApiErrors.apiUnknown,
      },
      result: NetworkResult.METHOD_DISALLOWED,
      error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!),
    );
  }

  // this return will take care of DioErrorType.other
  return NetworkResponse(
    data: {
      "message": AppStrings.apiErrors[ApiErrors.apiUnknown],
      "error": ApiErrors.apiUnknown,
    },
    result: NetworkResult.FAILURE,
    error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!),
  );
}

NetworkResponse _switchStatus(Response _response) {
  switch (_response.statusCode) {
    case 400:
      return NetworkResponse(
        data: {
          "message": AppStrings.apiErrors[ApiErrors.apiBadRequest],
          "error": ApiErrors.apiBadRequest,
        },
        result: NetworkResult.FAILURE,
        error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiBadRequest]!),
      );
    case 404:
      return NetworkResponse(
        data: {
          "message": AppStrings.apiErrors[ApiErrors.apiBadRequest],
          "error": ApiErrors.apiBadRequest,
        },
        result: NetworkResult.BAD_REQUEST,
        error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!),
      );
    case 500:
      return NetworkResponse(
        data: {
          "message": AppStrings.apiErrors[ApiErrors.apiServerError],
          "error": ApiErrors.apiServerError,
        },
        result: NetworkResult.SERVER_ERROR,
        error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!),
      );

    default:
      return NetworkResponse(
        data: {
          "message": AppStrings.apiErrors[ApiErrors.apiUnknown],
          "error": ApiErrors.apiUnknown,
        },
        result: NetworkResult.FAILURE,
        error: ApiFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!),
      );
  }
}
