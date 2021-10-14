import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart';

class Login implements UseCase<User, Map<String, dynamic>> {
   UserRepository _userRepository = UserRepository();

  Future<User> call(Map<String, dynamic> info) async {
    return await _userRepository.login(info);
  }
}
