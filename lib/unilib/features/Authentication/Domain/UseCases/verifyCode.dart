// import 'package:dartz/dartz.dart';
// import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
// import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
// import 'package:library_project/unilib/core/domain/usecases/usecases.dart';
// import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';

// class VerifyCode implements UseCase<bool, String> {
//   UserRepository _userRepository;
//   VerifyCode(this._userRepository);

//   Future<Either<Failure, bool>> call(String? code, {String? email}) async {
//     return await _userRepository.verifyUser(email!, code!);
//   }
// }
