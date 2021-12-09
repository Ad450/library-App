import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/failures.dart';

abstract class Usecase<ReturnType, Param> {
  Either<Failure, Future<ReturnType>> call(Param param);
}

class NoParam {}
