import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

class Logout implements Usecase<VoidType, NoParam> {
  UserRepository _userRepository;
  Logout(this._userRepository);

  @override
  Future<Either<UIError, VoidType>> call(param) async {
    try {
      await _userRepository.logout();
      return Right(VoidType());
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}
