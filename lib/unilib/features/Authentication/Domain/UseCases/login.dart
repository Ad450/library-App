import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import '../../Data/Models/user_model/user_model.dart';

class Login implements Usecase<UserModel, LoginParam> {
  UserRepository _userRepository;
  Login(this._userRepository);

  Future<Either<UIError, UserModel>> call(param) async {
    try {
      final _result = await _userRepository.login(
          email: param.email, password: param.password);
      return Right(_result);
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class LoginParam {
  final String email;
  final String password;

  const LoginParam({required this.email, required this.password});
}
