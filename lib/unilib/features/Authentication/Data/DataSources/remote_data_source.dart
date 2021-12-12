import 'package:library_project/unilib/core/data/network/network_response.dart';

import 'package:library_project/unilib/core/data/network/network_service.dart';

import '../Models/user_model/user_model.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> getVerificationCode(
      {required String email, required String password});

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
  Future<UserModel> getVerificationCode(
      {required String email, required String password}) async {
    final _response = await _networkService
        .post(url: "auth/resend-verification-link", body: {"email": email});

    if (_response.result == NetworkResult.SUCCESS) {
      return _response.data["data"];
    }
    throw _response.error;
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final _response = await _networkService
        .post(url: "auth/login", body: {"email": email, "password": password});
    if (_response.result == NetworkResult.SUCCESS) {
      return _response.data["data"];
    }

    throw _response.error;
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
    final _response =
        await _networkService.post(url: "auth/user-edit-profile/$id", body: {
      "name": name,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "email": email
    });
    if (_response.result == NetworkResult.SUCCESS) {
      return _response.data["data"];
    }

    throw _response.error;
  }

  @override
  Future<void> verifyCode({required String email, required String code}) async {
    final _response =
        await _networkService.get(url: "auth/email-verify/$code/$email");

    if (_response.result != NetworkResult.SUCCESS) {
      throw _response.error;
    }
  }
}
