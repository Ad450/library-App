import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class VerifyCode implements Usecase<VoidType, VerifyCodeParam> {
  UserRepository _userRepository;
  VerifyCode(this._userRepository);

  Future<Either<UIError, VoidType>> call(param) async {
    try {
      await _userRepository.verifyCode(email: param.email, code: param.code);
      return Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class VerifyCodeParam {
  final String email;
  final String code;

  const VerifyCodeParam({required this.email, required this.code});
}
