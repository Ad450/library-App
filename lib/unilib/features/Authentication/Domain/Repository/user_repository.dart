import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_code_sent.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';


abstract class UserRepository {
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> info);
  Future<Either<Failure, User?>> login(Map<String, dynamic> info);
  Future<Either<Failure, bool>> logout(VerifiedUser user);
  Future<Either<Failure, bool>> getVerificationCode();
  Future<Either<Failure, VerifiedUser>> verifyUser(User user, dynamic code);
  Future<Either<Failure, UserWithProfile>> setProfile(VerifiedUser user);
}
