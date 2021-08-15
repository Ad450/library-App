import 'package:library_project/provider/stateProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  bool? _showHomeScreen;
  String _prefKey = "isVerified";
  bool? _prefIsVerifiedBool;

  bool? get showHomeScreen => _showHomeScreen;

  bool? get prefIsVerifiedBool => _prefIsVerifiedBool;

  Future<void> _setShowBookScreenHandler(bool? isVerified) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.setBool(_prefKey, isVerified ?? false);
  }

  Future<void> setBookScreen(bool? isVerified) async {
    await _setShowBookScreenHandler(isVerified);
  }

  Future<bool?> _getHomeScreenHandler() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    bool? _prefsBool = _sharedPrefs.getBool(_prefKey) ?? false;
    return _prefsBool;
  }

  Future<bool?> getHomeScreen() async {
    _prefIsVerifiedBool = await _getHomeScreenHandler();
    return _prefIsVerifiedBool;
  }
}
