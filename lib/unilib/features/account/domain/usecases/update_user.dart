import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';
import '../../../Authentication/Data/Models/user_model/user_model.dart';

class UpdateUser implements Usecase<UserModel, UpdateUserParam> {
  AccountRepository _accountRepository;
  UpdateUser(this._accountRepository);

  @override
  Future<Either<Failure, UserModel>> call(param) async {
    try {
      final _user = await _accountRepository.updateUser(
        name: param.name,
        email: param.email,
        password: param.password,
      );

      return Right(_user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}

class UpdateUserParam {
  final String name;
  final String password;
  final String email;

  const UpdateUserParam({
    required this.name,
    required this.password,
    required this.email,
  });
}
