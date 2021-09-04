import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefs {
  bool? _showHomeScreen;
  String _prefKey = "isVerified";
  String _userIdPrefKey = "userID";
  bool? _prefIsVerifiedBool;
  String _isLoggedInKey = "loggedIn";
  bool isUserFormFilled = true;
  String _userFormFilledKey = "userForm";
  String _showProfileKey = "profile";
  String _userInfoKey = "userInfo";

  String get prefKey => _prefKey;
  bool? get showHomeScreen => _showHomeScreen;

  bool? get prefIsVerifiedBool => _prefIsVerifiedBool;

  Future<void> _setIsVerified(bool isVerified) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.setBool(_prefKey, isVerified);
  }

  Future<void> setIsVerifiedDB(bool isVerified) async {
    await _setIsVerified(isVerified);
  }

  Future<void> _setShowProfile(bool state) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(_showProfileKey, state);
  }

  Future<void> setShowProfile(bool state) async {
    await _setShowProfile(state);
  }

  Future<bool> _getshowProfile() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(_showProfileKey) ?? false;
  }

  Future<bool> getShowProfile() async {
    return _getshowProfile();
  }

  Future<bool> _getIsVerified() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    bool _prefsBool = _sharedPrefs.getBool(_prefKey) ?? false;
    // assert(_sharedPrefs.containsKey(_prefKey));
    return _prefsBool;
  }

  Future<bool> getIsVerifiedDB() async {
    bool prefBool = await _getIsVerified();
    return prefBool;
  }

  Future<dynamic> _setUserID(dynamic _userId) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setInt(_userIdPrefKey, _userId);
  }

  Future<dynamic> _getUserID() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    var _userId = _sharedPrefs.getInt(_userIdPrefKey) ?? null;
    return _userId;
  }

  Future<dynamic> setUserIdDB(dynamic _userId) async {
    await _setUserID(_userId);
  }

  Future<dynamic> getUserIdDB() async {
    return await _getUserID();
  }

  Future<void> _setLoggedInDB(bool isLoggedIn) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  Future<bool> _getIsLoggedIn() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    bool isLoggedIn = _sharedPrefs.getBool(_isLoggedInKey) ?? false;
    return isLoggedIn;
  }

  Future<void> setLoggedInDB(bool isloggedIn) async {
    await _setLoggedInDB(isloggedIn);
  }

  Future<bool> getIsloggedInDB() async {
    return await _getIsLoggedIn();
  }

  Future<bool> _userFormFilled(bool isUserFormFilled) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    var formFilledState =
        await _sharedPrefs.setBool(_userFormFilledKey, isUserFormFilled);
    return formFilledState;
  }

  Future<bool> userFormFilled(bool formFilledState) async {
    return await _userFormFilled(formFilledState);
  }

  Future<bool> _getUserFormFilled() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.getBool(_userFormFilledKey) ?? false;
  }

  Future<bool> getUserFormFilled() async {
    return await _getUserFormFilled();
  }

  String encodeMap(Map<String, dynamic> userMap) {
    return jsonEncode(userMap);
  }

  Map<String, dynamic> decodeString(String _userMapString) {
    return jsonDecode(_userMapString);
  }

  Future<void> _setUserInfo(Map<String, dynamic> userMap) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(_userInfoKey, encodeMap(userMap));
  }

  Future<void> setUserInfo(Map<String, dynamic> _userMap) async {
    await _setUserInfo(_userMap);
  }

  Future<String> _getUserInfo() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(_userInfoKey) ?? "";
  }

  Future<String> getUserInfo() async {
    return await _getUserInfo();
  }
}
