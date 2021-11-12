import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';


class GetVerificationCode implements UseCase<bool, NoParam> {
  UserRepository _userRepository;
  GetVerificationCode(this._userRepository);

  @override
  Future<Either<Failure, bool>> call(NoParam? noParam) async {
    return await _userRepository.getVerificationCode();
  }
}
