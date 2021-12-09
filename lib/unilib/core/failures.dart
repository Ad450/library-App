abstract class Failure {
  final String message;
  const Failure(this.message);
}

class UIError extends Failure {
  const UIError(String message) : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(String message) : super(message);
}
