import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class Logout implements UseCase<bool, VerifiedUser> {
  UserRepository _userRepository;
  Logout(this._userRepository);

  @override
  Future<Either<Failure, bool>> call(VerifiedUser? user, {String? email}) async {
    return await _userRepository.logout(user!);
  }
}
