import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';


class SignIn implements UseCase<User, Map<String, dynamic>> {
  UserRepository _userRepository;
  SignIn(this._userRepository);

  Future<User?> call(Map<String, dynamic> info) async {
    return await _userRepository.signIn(info);
  }
}
