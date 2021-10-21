import 'dart:convert';

import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Users/Data/DataSources/remote_dataSources/remote_user_source.dart';
import 'package:library_project/unilib/features/Users/Data/Models/user_model.dart';
import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart';
import 'package:http/http.dart' as http;

class RemoteUserSourceImpl implements RemoteUserSource {
  RemoteUserSourceImpl._();

  static final RemoteUserSourceImpl instance = RemoteUserSourceImpl._();

  factory RemoteUserSourceImpl() => instance;

  @override
  Future<bool> getVerificationCode() async {
    String getVerificationCodeEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(Map<String, dynamic> info) async {
    String loginEndpoint = "https://uenrlibrary.herokuapp.com/api/auth/login";
    throw UnimplementedError();
  }

  @override
  Future<bool> logout(VerifiedUser user) async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserWithProfileModel> setProfile(VerifiedUser user) async {
    // TODO: implement setProfile
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn(Map<String, dynamic> info) async {
    String signUpEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/register";
    Uri _uri = Uri.parse(signUpEndpoint);
    var response = await http.post(_uri,
        body: jsonEncode(info), headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {}
    throw UnimplementedError(); 
  }

  @override
  Future<VerifiedUserModel> verifyUser(User user, dynamic code) async {
    String verifyUser =
        "https://uenrlibrary.herokuapp.com/api/auth/email-verify/verification-code/${user.email}/$code";
    throw UnimplementedError();
  }
}
