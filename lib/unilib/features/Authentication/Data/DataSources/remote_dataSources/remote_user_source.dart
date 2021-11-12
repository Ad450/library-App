import 'package:dartz/dartz.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Entities/User.dart';


abstract class RemoteUserSource {
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> info);
  Future<Either<Failure, UserModel?>> login(Map<String, dynamic> info);
  Future<Either<Failure, bool>> logout(VerifiedUser user);
  Future<Either<Failure, bool>> getVerificationCode();
  Future<Either<Failure, VerifiedUserModel>> verifyUser(User user, dynamic code);
  Future<Either<Failure, UserWithProfileModel>> setProfile(VerifiedUser user);
}
