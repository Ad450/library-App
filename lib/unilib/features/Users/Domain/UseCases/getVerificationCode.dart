import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_code_sent.dart';

import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart';

class GetVerificationCode implements UseCase<bool, NoParam> {
  UserRepository _userRepository = UserRepository();

  @override
  Future<bool> call(NoParam noparam) async {
    return await _userRepository.getVerificationCode();
  }
}
