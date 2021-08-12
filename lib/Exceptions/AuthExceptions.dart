class AuthException implements Exception {
  String _loginExceptionString = "could not login, please try again";

  void loginException() => throw _loginExceptionString;
}
