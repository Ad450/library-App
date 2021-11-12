import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';


class SetProfile implements UseCase<UserWithProfile, VerifiedUser> {
  UserRepository _userRepository;
  SetProfile(this._userRepository);

  //SetProfile(this._userRepository);

  Future<Either<Failure, UserWithProfile>> call(VerifiedUser? verifiedUser) async {
    return await _userRepository.setProfile(verifiedUser!);
  }
}
