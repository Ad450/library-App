import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Users/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart';

class SetProfile implements UseCase<UserWithProfile, VerifiedUser> {
  UserRepository _userRepository = UserRepository();

  //SetProfile(this._userRepository);

  Future<UserWithProfile> call(VerifiedUser verifiedUser) async {
    return await _userRepository.setProfile(verifiedUser);
  }
}
