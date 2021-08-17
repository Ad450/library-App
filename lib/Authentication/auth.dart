import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:library_project/SharedPrefs.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

class Auth {
  static String? _verificationMessage;
  static String? _token;
  static String? _userId;
  static final String _loginEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/login";
  static final String _signUpEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/register";
  static String _verificationEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/resend-verification-link";

  static String _retrieveUsersEndpoint =
      "https://uenrlibrary.herokuapp.com/api/auth/retrieve-all-users";

  static Map<String, dynamic>? _userMap;

  static SharedPrefs _sharedPrefs = SharedPrefs();
  // signing Up users

  String? get verificationMessage => _verificationMessage;

  static StateProvider _provider(BuildContext _context) {
    return Provider.of<StateProvider>(_context, listen: false);
  }

  static Future<void> _signUpUser(
      Map<String, dynamic>? _userMap, BuildContext _context) async {
    var _stateProvider = _provider(_context);
    print("the function got here");

    print(json.encode(_userMap));

    Uri _url = Uri.parse(_signUpEndpoint);
    assert(_userMap != null);
    if (_userMap != null) {
      try {
        print("function got here too");
        var response = await http.post(_url,
            body: json.encode(_userMap),
            headers: {"content-type": "application/json"});

        if (response.statusCode == 201) {
          _stateProvider.changeSignUpLoading(false);
          _stateProvider.changeHasSignedUp(true);
        } else {
          var responseData = json.decode(response.body);
          print(responseData["message"]);
          _stateProvider.changeAuthMessage(responseData["message"]);
          _stateProvider.changeSignUpLoading(false);
        }
      } catch (error) {
        print(error);
        print("could not signUp");
      }
    }
  }

  static Future<void> signUp(
      Map<String, dynamic> userMap, BuildContext context) async {
    await _signUpUser(userMap, context);
  }

  static Future<void> _loginUser(
      Map<String, dynamic> _userMap, BuildContext _context) async {
    var _stateProvider = _provider(_context);
    assert(_userMap.isNotEmpty);
    try {
      print(_userMap);

      Uri _loginUrl = Uri.parse(_loginEndpoint);
      var _response = await http.post(_loginUrl,
          body: json.encode(_userMap),
          headers: {"content-type": "application/json"});
      print("function got here");
      print(_response.statusCode);

      if (_response.statusCode == 200) {
        var dataFromApi = json.decode(_response.body);
        print(dataFromApi);

        _stateProvider.changeLogInState(true);
        _stateProvider.changeLoginLoading(false);
      } else {
        var dataFromApi = json.decode(_response.body);

        _stateProvider.changeLoginMessage(dataFromApi["message"]);
        _stateProvider.changeLoginLoading(false);
      }
    } catch (error) {
      print(error);
    }
  }

  static Future<void> login(
      Map<String, dynamic> _userMap, BuildContext context) async {
    await _loginUser(_userMap, context);
  }

  static Future<void> _handleVerification(
      Map<String, dynamic> _userMap, BuildContext _context) async {
    var _stateProvider = _provider(_context);
    var _response = await http.post(Uri.parse(_verificationEndpoint),
        body: json.encode(_userMap),
        headers: {"content-type": "application/json"});

    assert(_userMap.isNotEmpty);
    try {
      print(_userMap);
      if (_response.statusCode == 200) {
        dynamic _result = json.decode(_response.body);
        _stateProvider.changeIsVerifiedState(true);
        _stateProvider.changeVerificationLoadingState(false);
        _stateProvider.changeVerificationMessage(_result["message"]);
        _sharedPrefs.setBookScreen(_stateProvider.isVerified);
      } else {
        print(_response.statusCode);
        dynamic _result = json.decode(_response.body);
        _stateProvider.changeVerificationLoadingState(false);
        _stateProvider.changeVerificationMessage(_result["message"]);
      }
    } catch (error) {
      // will use exceptions later
      print(error);
    }
  }

  static Future<void> getVerification(
      Map<String, dynamic> userMap, BuildContext _context) async {
    await _handleVerification(userMap, _context);
  }

  static Future<void> _handleRetrieveUsers(BuildContext _context) async {
    Uri _url = Uri.parse(_retrieveUsersEndpoint);
    final response = await http.get(_url);
    var _stateProvider = _provider(_context);
    try {
      if (response.statusCode == 200) {
        var userInfo = json.decode(response.body);
        _stateProvider.setUserInfo(userInfo["data"]);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> handleRetrieveUsers(BuildContext _context) async {
    await _handleRetrieveUsers(_context);
  }
}
