class Failure implements Exception {
  String message;
  Failure(this.message);

  @override
  String toString() => message;
}
