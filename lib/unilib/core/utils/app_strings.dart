// idea behind is simple
// all one user friendly error_strings will be stored here

abstract class AppStrings {
  static Map<ApiErrors, String> apiErrors = {
    ApiErrors.apiConnectionTimeout: _apiConnectionTimeout,
    ApiErrors.apiUnauthenticated: _apiUnauthenticated,
    ApiErrors.apiNoResponse: _apiNoResponse,
    ApiErrors.apiBadRequest: _apiBadRequest,
    ApiErrors.databaseException: _databaseException,
    ApiErrors.apiUnknown: _apiUknown,
    ApiErrors.apiServerError: _apiServerError
  };

  static String _apiUnauthenticated = "You need authentication to perform this action";
  static String _databaseException = "Database Access Failure";
  static String _apiNoResponse = "Something went wrong";
  static String _apiBadRequest = "There was a problem making the request to the server";
  static String _apiConnectionTimeout = "Connection time out";
  static String _apiUknown = "Something went wrong";
  static String _apiServerError = "something went wrong";
}

enum ApiErrors {
  apiConnectionTimeout,
  apiUnauthenticated,
  apiNoResponse,
  apiBadRequest,
  databaseException,
  apiUnknown,
  apiServerError,
}
