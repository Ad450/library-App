import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/error_helpers.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';
import '../../../Authentication/Data/Models/user_model/user_model.dart';

class GetUser implements Usecase<UserModel, GetUserParam> {
  AccountRepository _accountRepository;
  GetUser(this._accountRepository);

  @override
  Future<Either<Failure, UserModel>> call(param) async {
    try {
      final _user = await _accountRepository.getUser(param.id);
      return Right(_user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromFailure(e, s));
    }
  }
}

class GetUserParam {
  final String id;
  const GetUserParam(this.id);
}
