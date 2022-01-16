import 'package:library_project/unilib/core/data/network/network_response.dart';

import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/core/failures.dart';

import '../Models/user_model/user_model.dart';

abstract class RemoteUserDataSource {
  Future<void> getVerificationCode({required String email, required String password});

  Future<UserModel> login({required String email, required String password});
  Future<void> logout();

  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword,
      required String id});

  Future<void> verifyCode({required String email, required String code});
}

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  NetworkService _networkService;
  RemoteUserDataSourceImpl(this._networkService);

  @override
  Future<void> getVerificationCode({
    required String email,
    required String password,
  }) async {
    final _response = await _networkService.post(
      url: "auth/resend-verification-link",
      body: {"email": email},
    );

    if (_response.result != NetworkResult.SUCCESS) {
      throw ApiFailure(_response.data["message"]);
    } else {
      return;
    }

    // return getVerificationCode(email: email, password: password);
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final _response = await _networkService.post(
      url: "auth/login",
      body: {
        "email": email,
        "password": password,
      },
    );
    if (_response.result == NetworkResult.SUCCESS) {
      final json = _response.data;
      return UserModel.fromJson(json);
    } else if (_response.data.containsKey("error")) {
      throw ApiFailure(_response.data["message"]);
    }
    return login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String oldPassword,
      required String newPassword,
      required String id}) async {
    final _response = await _networkService.post(
      url: "auth/user-edit-profile/$id",
      body: {
        "name": name,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "email": email,
      },
    );
    if (_response.result == NetworkResult.SUCCESS) {
      final json = _response.data;
      return UserModel.fromJson(json);
    } else if (_response.data.containsKey("error")) {
      throw ApiFailure(_response.data["message"]);
    }
    return updateUser(
      name: name,
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
      id: id,
    );
  }

  @override
  Future<void> verifyCode({
    required String email,
    required String code,
  }) async {
    final _response = await _networkService.get(url: "auth/email-verify/$code/$email");

    if (_response.result != NetworkResult.SUCCESS) {
      if (_response.data.containsKey("error")) {
        throw ApiFailure(_response.data["message"]);
      }

      verifyCode(email: email, code: code);
    } else {
      return;
    }
  }
}
