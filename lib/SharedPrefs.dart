import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  bool? _showHomeScreen;
  String _prefKey = "isVerified";
  String _userIdPrefKey = "userID";
  bool? _prefIsVerifiedBool;
  String _isLoggedInKey = "loggedIn";

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
    var _userId = _sharedPrefs.getInt(_userIdPrefKey);
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
}
