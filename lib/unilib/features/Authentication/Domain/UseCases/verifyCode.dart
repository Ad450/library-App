import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class VerifyCode implements UseCase<VerifiedUser, User> {
  UserRepository _userRepository;
  VerifyCode(this._userRepository);

  Future<Either<Failure, VerifiedUser>> call(User? user) async {
    return await _userRepository.verifyUser(user!, user.code);
  }
}
