import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  static Map<String, dynamic>? _userMap;

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
    if (_userMap != null) {
      try {
        print("function got here too");
        var response = await http.post(_url,
            body: json.encode(_userMap),
            headers: {"content-type": "application/json"});
        // print(response.statusCode);
        if (response.statusCode == 201) {
          // print(json.decode(response.body));
          // print("registered ");
          _stateProvider.changeAuthSuccessfullState(false);
          _stateProvider.changeHasSignedUp(true);
        } else {
          print(response.statusCode);
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
        var _stateProvider = _provider(_context);

        _stateProvider.changeLogInState(true);
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
    var _provider = Provider.of<StateProvider>(_context);
    var _response = await http.post(Uri.parse(_verificationEndpoint),
        body: json.encode(_userMap),
        headers: {"content-type": "application/json"});
    try {
      print(_userMap);
      if (_response.statusCode == 200) {
        dynamic _result = json.decode(_response.body);
        _provider.changeIsVerifiedState(true);
        _provider.changeVerificationLoadingState(false);
        _verificationMessage = _result.message;
        print(_verificationMessage);
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
}
