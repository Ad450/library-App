import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:library_project/Data/DataProvider/abstract_auth_generator.dart';

class AuthApi implements Authentication {
  final String _loginEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/login";

  static final String _signUpEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/register";

  static final String _verificationEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";

  static final String _retrieveUsersEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/retrieve-all-users";

  Future<http.Response?> _genericMethod(
      Map<String, dynamic> userInfo, String url) async {
    Uri _uri = Uri.parse(url);
    try {
      var _response = await http.post(_uri,
          body: json.encode(userInfo),
          headers: {"content-type": "application/json"});
      return _response;
    } catch (e) {
      return null;
    }
  }

  Future<void> signUp(Map<String, dynamic> userInfo) async {
    http.Response? response = await _genericMethod(userInfo, _signUpEndpoint);
    if (response != null) {
      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        print("data fetch failed");
      }
    }
  }

  Future<void> login(Map<String, dynamic> userInfo) async {
    http.Response? response = await _genericMethod(userInfo, _loginEndpoint);
    if (response != null) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print("data fetch failed");
      }
    }
  }

  Future<void> getVerificationCode(String email) async {
    Uri url = Uri.parse(_verificationEndpoint);
    Map _userMap = {"email": email};
    try {
      http.Response response = await http.post(url,
          body: json.encode(_userMap),
          headers: {"content-type": "application/json"});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getOTPVerification(Map<String, dynamic> userInfo) async {
    String otpEndpoint =
        "https://uenrlibrary.herokuapp.com/api/auth/email-verify/verification-code/${userInfo["email"]}/${userInfo["optCode"]}";
    Uri _url = Uri.parse(otpEndpoint);
    try {
      http.Response response = await http.get(_url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
