import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart';
import 'package:library_project/unilib/features/Users/Data/DataSources/remote_dataSources/remote_user_source.dart';
import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';

class RemoteUserSourceImpl implements RemoteUserSource {
  RemoteUserSourceImpl._();

  static final RemoteUserSourceImpl instance = RemoteUserSourceImpl._();

  factory RemoteUserSourceImpl() => instance;

  @override
  Future<bool> getVerificationCode() async{
    String getVerificationCodeEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";
    throw UnimplementedError();
  }

  @override
  Future<User> login(Map<String, dynamic> info)async {
    String loginEndpoint = "https://uenrlibrary.herokuapp.com/api/auth/login";
    throw UnimplementedError();
  }

  @override
  Future<bool> logout(VerifiedUser user) async{
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserWithProfile> setProfile(VerifiedUser user) async{
    // TODO: implement setProfile
    throw UnimplementedError();
  }

  @override
  Future<User> signIn(Map<String, dynamic> info) async{
    String signUpEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/register";
    throw UnimplementedError();
  }

  @override
  Future<VerifiedUser> verifyUser(User user, dynamic code) async{
    String verifyUser =
        "https://uenrlibrary.herokuapp.com/api/auth/email-verify/verification-code/${user.email}/$code";
    throw UnimplementedError();
  }
}
