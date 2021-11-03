import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class Logout implements UseCase<bool, VerifiedUser> {
  UserRepository _userRepository;
  Logout(this._userRepository);

  @override
  Future<bool> call(VerifiedUser user) async {
    return await _userRepository.logout(user);
  }
}
