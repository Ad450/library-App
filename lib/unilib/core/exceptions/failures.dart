class Failure {
  String message;
  Failure(this.message);

  @override
  String toString() => message;
}

class SocketFailure extends Failure {
  SocketFailure(String message) : super(message);
}
