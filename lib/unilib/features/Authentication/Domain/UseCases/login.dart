
import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';


class Login implements UseCase<User, Map<String, dynamic>> {
  UserRepository _userRepository;
  Login(this._userRepository);

  Future<Either<Failure, User?>> call(Map<String, dynamic>? info) async {
    return await _userRepository.login(info!);
  }
}
