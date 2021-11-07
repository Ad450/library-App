
class Right<L, R> extends Either<L, R> {
  dynamic value;
  Right(this.value);
}

class Left<L,R> extends Either<L, R> {
  dynamic value;
  Left(this.value);
}

class Either<L, R> {}