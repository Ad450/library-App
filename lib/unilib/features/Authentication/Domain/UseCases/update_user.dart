import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import '../../Data/Models/user_model/user_model.dart';

class UpdateUser implements Usecase<UserModel, UpdateUserParam> {
  UserRepository _userRepository;
  UpdateUser(this._userRepository);

  Future<Either<UIError, UserModel>> call(param) async {
    try {
      final _result = await _userRepository.updateUser(
          name: param.name,
          email: param.email,
          oldPassword: param.oldPassword,
          newPassword: param.newPassword,
          id: param.id);

      return Right(_result);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}

class UpdateUserParam {
  final String name;
  final String email;
  final String oldPassword;
  final String newPassword;
  final String id;

  const UpdateUserParam(
      {required this.email,
      required this.oldPassword,
      required this.name,
      required this.newPassword,
      required this.id});
}
