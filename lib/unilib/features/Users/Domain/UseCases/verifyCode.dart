import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart';

class VerifyCode implements UseCase<VerifiedUser, NoParam> {
  UserRepository _userRepository = UserRepository();

  Future<VerifiedUser> call(NoParam noParam) async {
    return await _userRepository.verifyCode();
  }
}
