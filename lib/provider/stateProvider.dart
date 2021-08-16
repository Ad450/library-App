import 'package:flutter/foundation.dart';

class StateProvider with ChangeNotifier {
  bool _isVerified = false;
  bool _isLoggedIn = false;
  bool _isAuthLoading = false;
  bool _hasSignedUp = false;
  bool _isLoginLoading = false;
  bool _verificationLoading = false;
  String? _authMessage;
  String? _loginMessage;
  String? _verificationMessage;

  Map<String, dynamic>? _userInfo;

  Map<String, dynamic>? get userInfo => _userInfo;

  String? get verificationMessage => _verificationMessage;

  String? get loginMessage => _loginMessage;

  String? get getAuthMessage => _authMessage;

  bool get hasSignedUp => _hasSignedUp;

  bool get isLoginLoading => _isLoginLoading;

  bool get verificationLoading => _verificationLoading;

  bool get isVerified {
    return _isVerified;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  bool get isAuthLoading => _isAuthLoading;

  void changeLoginMessage(String? message) {
    _loginMessage = message;
    notifyListeners();
  }

  void setUserInfo(Map<String, dynamic> userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  void changeVerificationMessage(String? message) {
    _verificationMessage = message;
    notifyListeners();
  }

  void changeIsVerifiedState(bool state) {
    _isVerified = state;
    notifyListeners();
  }

  void changeAuthMessage(String message) {
    _authMessage = message;
    notifyListeners();
  }

  void changeHasSignedUp(bool state) {
    _hasSignedUp = state;
    notifyListeners();
  }

  void changeLoginLoading(bool state) {
    _isLoginLoading = state;
    notifyListeners();
  }

  void changeSignUpLoading(bool state) {
    _isAuthLoading = state;
    notifyListeners();
  }

  void changeLogInState(bool state) {
    _isVerified = state;
    notifyListeners();
  }

  void changeVerificationLoadingState(bool state) {
    _verificationLoading = true;
    notifyListeners();
  }
}
