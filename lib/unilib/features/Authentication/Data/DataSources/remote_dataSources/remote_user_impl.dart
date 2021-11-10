import 'dart:convert';

import 'package:library_project/unilib/core/Data/platforms/connectivity/connectivity_contract.dart';
import 'package:library_project/unilib/core/Data/platforms/connectivity/connectivity_impl.dart';
import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteUserSourceImpl implements RemoteUserSource {
  RemoteUserSourceImpl._();

  static final RemoteUserSourceImpl instance = RemoteUserSourceImpl._();

  factory RemoteUserSourceImpl() => instance;

  @override
  Future<bool> getVerificationCode() async {
    String getVerificationCodeEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";
    bool isCodeSent = false;
    Uri _uri = Uri.parse(getVerificationCodeEndpoint);
    var _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      isCodeSent = true;
      return isCodeSent;
    }
    return isCodeSent;
  }

  @override
  Future<UserModel?> login(Map<String, dynamic> info) async {
    String loginEndpoint = "https://uenrlibrary.herokuapp.com/api/auth/login";
    UserModel _userModel;
    Uri _uri = Uri.parse(loginEndpoint);
    var _response = await http.post(_uri,
        headers: {"content-type": "application/json"}, body: jsonEncode(info));
    if (_response.statusCode == 200) {
      var body = jsonDecode(_response.body);
      _userModel = UserModel(
        email: body["email"],
        name: body["name"],
        id: body["id"],
      );
      return _userModel;
    }
    // ids should start from 1..zero for failed login
    return null;
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
  Future<UserModel?> signIn(Map<String, dynamic> info) async {
    String signUpEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/register";
    UserModel _userModel;
    Uri _uri = Uri.parse(signUpEndpoint);
    var response;
    if (await NetWorkConnectivity().call() != NetworkStatus.off) {
      print("network isnot off");
      response = await http.post(_uri,
          body: jsonEncode(info),
          headers: {"content-type": "application/json"});
    } else {
      return null;
    }

    print("before signing user");

    if (response.statusCode == 200) {
      print("function execution got here");
      var body = jsonDecode(response.body);
      _userModel = UserModel(
        email: body["email"],
        name: body["name"],
        id: body["id"],
      );
      return _userModel;
    }
    return null;
  }

  @override
  Future<VerifiedUserModel> verifyUser(user, code) {
    // TODO: implement verifyUser
    throw UnimplementedError();
  }

  // @override
  // Future<VerifiedUserModel> verifyUser(User user, dynamic code) async {
  //   String verifyUser =
  //       "https://uenrlibrary.herokuapp.com/api/auth/email-verify/verification-code/${user.email}/$code";
  //   Uri _uri = Uri.parse(verifyUser);
  //   var _response = await http.post(_uri);
  //   if (_response.statusCode == 200) {
  //     var _body = jsonDecode(_response.body);
  //     return VerifiedUserModel(
  //         name: _body["name"], email: _body["email"], id: _body["id"]);
  //   }
  //   throw UnimplementedError();
  // }

}
