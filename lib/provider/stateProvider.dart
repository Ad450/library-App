import 'package:flutter/foundation.dart';

class StateProvider with ChangeNotifier {
  bool _isVerified = false;
  bool _isLoggedIn = false;
  bool _isAuthLoading = false;
  bool _hasSignedUp = false;
  bool _isLoginLoading = false;
  bool _verificationLoading = false;
  bool? _userFormPostSuccess = false;
  String? _authMessage;
  String? _loginMessage;
  String? _verificationMessage;
  String? _userFormAuthMessage;
  bool _showSnackBar = false;
  bool? _userFormAuthLoading;



  // StateProvider({isVerified : false, isLoggedIn : false , isAuthLoading}): _isVerified= isVerified;

  Map<String, dynamic>? _userInfo = {};

  Map<String, dynamic>? get userInfo => _userInfo;

  bool get showSnackBar => _showSnackBar;

  bool? get userFormPostSuccessful => _userFormPostSuccess;

  String? get verificationMessage => _verificationMessage;

  String? get loginMessage => _loginMessage;

  String? get userFormAuthMessage => _userFormAuthMessage;
  String? get getAuthMessage => _authMessage;

  bool get hasSignedUp => _hasSignedUp;

  bool get isLoginLoading => _isLoginLoading;

  bool get verificationLoading => _verificationLoading;

  bool? get userFormAuthLoading => _userFormAuthLoading;

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

  void changeUserFormAuthLoading(bool state) {
    _userFormAuthLoading = state;
    notifyListeners();
  }

  void changeShowSnackBar(bool state) {
    _showSnackBar = state;
    notifyListeners();
  }

  void changeUserFormPostSuccess(bool? _state) {
    _userFormPostSuccess = _state;
    notifyListeners();
  }

  void changeVerificationMessage(String? message) {
    _verificationMessage = message;
    notifyListeners();
  }

  void changeUserFormAuthMessage(String message) {
    _userFormAuthMessage = message;
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
    print("got here");
    notifyListeners();
  }

  void changeSignUpLoading(bool state) {
    _isAuthLoading = state;
    notifyListeners();
  }

  void changeLogInState(bool state) {
    _isLoggedIn = state;
    notifyListeners();
  }

  void changeVerificationLoadingState(bool state) {
    _verificationLoading = true;
    notifyListeners();
  }
}
