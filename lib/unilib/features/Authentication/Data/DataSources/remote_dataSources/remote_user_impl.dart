import 'package:dartz/dartz.dart';

import 'package:library_project/unilib/core/Data/network/network_result.dart';
import 'package:library_project/unilib/core/Data/network/network_service.dart';
import 'package:library_project/unilib/core/domain/entities/exceptions/logging_in_user_exception.dart';
import 'package:library_project/unilib/core/domain/entities/user/userWithProfile_model.dart';
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart';
import 'package:library_project/unilib/core/domain/entities/user/verified_user_model.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model.dart';

class RemoteUserSourceImpl implements RemoteUserSource {
  NetworkService _networkService;

  RemoteUserSourceImpl(this._networkService);

  @override
  Future<Either<Failure, bool>> getVerificationCode(Map<String, dynamic> info) async {
    var _result;
    String getVerificationCodeEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";
    
   _result = await _networkService.post(url: getVerificationCodeEndpoint, body: info);
    if (_result.result == NetworkResult.SUCESS) return Right(true);

    if (_result.result == NetworkResult.ERROR)
      return Left(Failure("please try again"));

    if (_result.result == NetworkResult.UNAUTHORISED) {
      print("function unauthorised");
      return Left(Failure("not authorised, please try again"));
    }

   return Left(_result.failure);

  }

  // @override
  // Future<Either<Failure, UserModel?>> login(Map<String, dynamic> info) async {
  //   String loginEndpoint = "https://uenrlibrary.herokuapp.com/api/auth/login";
  //   UserModel _userModel;
  //   Uri _uri = Uri.parse(loginEndpoint);
  //   var _response = await http.post(_uri,
  //       headers: {"content-type": "application/json"}, body: jsonEncode(info));
  //   if (_response.statusCode == 200) {
  //     var body = jsonDecode(_response.body);
  //     _userModel = UserModel(
  //       email: body["email"],
  //       password: "",
  //       id: body["id"],
  //     );
  //     return _userModel;
  //   }
  //   // ids should start from 1..zero for failed login
  //   return null;
  // }

  @override
  Future<Either<Failure, bool>> logout(VerifiedUser user) async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserWithProfileModel>> setProfile(
      VerifiedUser user) async {
    // TODO: implement setProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> info) async {
    String signUpEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/register";
    print(info);
    print("function in remote user impl");
    var result = await _networkService.post(url: signUpEndpoint, body: info);
    if (result.result == NetworkResult.SUCESS) return Right(true);

    if (result.result == NetworkResult.ERROR)
      return Left(Failure("please try again"));

    if (result.result == NetworkResult.UNAUTHORISED) {
      print("function unauthorised");
      return Left(Failure("not authorised, please try again"));
    }

    return Left(result.failure);
  }

  @override
  Future<Either<Failure, VerifiedUserModel>> verifyUser(user, code) {
    // TODO: implement verifyUser
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, UserModel?>> login(Map<String, dynamic> info) {
    // TODO: implement login
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
