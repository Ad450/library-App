import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import '../../Data/Models/user_model/user_model.dart';

class CheckLogin implements Usecase<UserModel?, NoParam> {
  final UserRepository _userRepository;
  CheckLogin(this._userRepository);

  @override
  Future<Either<Failure, UserModel?>> call(NoParam param) async {
    try {
      final _user = await _userRepository.getCachedUser();
      return Right(_user);
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}
