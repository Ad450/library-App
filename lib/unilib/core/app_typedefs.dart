import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/failures.dart';

abstract class Usecase<ReturnType, Param> {
  Future<Either<Failure, ReturnType>> call(Param param);
}

class NoParam {
  const NoParam();
}

class VoidType {
  const VoidType();
}
