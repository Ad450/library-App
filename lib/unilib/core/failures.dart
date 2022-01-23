abstract class Failure {
  final String message;
  const Failure(this.message);
}

class UIError extends Failure {
  const UIError(String message) : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure(String message) : super(message);

  @override
  bool operator ==(Object object) {
    if (identical(this, object)) return true;
    return object is ApiFailure && object.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
