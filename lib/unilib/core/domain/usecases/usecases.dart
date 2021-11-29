// interface for all usecases

import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';

abstract class UseCase<ReturnType, ParamType> {
  Future<Either<Failure, ReturnType?>> call(ParamType? type, {String email});
}
