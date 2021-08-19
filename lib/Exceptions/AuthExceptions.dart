import 'dart:io';

class AuthException extends SocketException {
  String message = "Please check internet connection";

  AuthException(this.message) : super(message);
}
