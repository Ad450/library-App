import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class GetVerificationCode implements Usecase<VoidType, GetVerificationCodeParam> {
  UserRepository _userRepository;
  GetVerificationCode(this._userRepository);

  @override
  Future<Either<UIError, VoidType>> call(param) async {
    try {
      await _userRepository.getVerificationCode(email: param.email, password: param.password);
      return Right(VoidType());
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}

class GetVerificationCodeParam {
  final String email;
  final String password;
  const GetVerificationCodeParam({required this.email, required this.password});
}
