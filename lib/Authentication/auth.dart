import 'dart:convert';
import 'dart:io';

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
      } on SocketException catch (e) {
        _stateProvider.changeSignUpLoading(false);
        _stateProvider
            .changeAuthMessage("please check your internet connection");
        print(e);
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
        _sharedPrefs.setLoggedInDB(true);
        _sharedPrefs.setUserIdDB(dataFromApi["id"]);
        _stateProvider.changeLoginLoading(false);
      } else {
        var dataFromApi = json.decode(_response.body);

        _stateProvider.changeLoginMessage(dataFromApi["message"]);
        _stateProvider.changeLoginLoading(false);
      }
    } on SocketException catch (e) {
      _stateProvider.changeLoginLoading(false);
      _stateProvider
          .changeLoginMessage("Please check your internet connection");
      print(e);
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
        _sharedPrefs.setIsVerifiedDB(true);
      } else {
        print(_response.statusCode);
        dynamic _result = json.decode(_response.body);
        _stateProvider.changeVerificationLoadingState(false);
        _stateProvider.changeVerificationMessage(_result["message"]);
      }
    } on SocketException catch (e) {
      _stateProvider.changeVerificationLoadingState(false);
      _stateProvider
          .changeVerificationMessage("please check your internet connection");
      print(e);
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

  // get two booleans
  //one to determine whether to show the landing screen or GiveDetailsScreen if logged in
  // one to also determine whether to show the bookscreen or the profile screen in the GiveDetailsScreen
  // set userID sharedPrefs at the time of loggin in if status code is 200
  // get UserId in the initstate of the profile Screen from GiveDetailsScreen
  // set one boolean say finishedProfile to true.inintial value to be false
  // set the other boolean to say isLoginIn to true . initial value to be false
  // finishedProfile is put on GiveDetailsScreen
  // isLoginIn is put on the first welcome screen scaffold widget after the material widget
}


// continue with the user profile form .. post form by user id 
// intentionally interrupt signUp and the login process to check the respond of the widgets
// collect first screen pageView from litmus 