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
  bool? _userFormAuthLoading = false;
  bool _isAuthCompleted = false;
  bool _authOTPSucces = false;
  bool _otpSuccessfull = false;
  String _userEmail = "";
  bool _otpLoading = false;
  String _otpMessage = "";
  int? _userID;

  Map<String, dynamic>? _userInfo = {};

  int? get userID => _userID;

  String get userEmail => _userEmail;

  bool get otpSuccesfull => _otpSuccessfull;

  Map<String, dynamic>? get userInfo => _userInfo;
  bool get authOTPSucces => _authOTPSucces;

  bool get isAuthCompleted => _isAuthCompleted;

  bool get showSnackBar => _showSnackBar;
  bool get otpLoading => _otpLoading;

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

  String get otpMessage => _otpMessage;

  bool get isAuthLoading => _isAuthLoading;

  void changeProfileAuthCompleted(bool state) {
    _isAuthCompleted = state;
    notifyListeners();
  }

  void changeOTPLoading(bool state) {
    _otpLoading = state;
    notifyListeners();
  }

  void changeOTPMessage(String message) {
    _otpMessage = message;
    notifyListeners();
  }

  void changeUserID(int id) {
    _userID = id;
    notifyListeners();
  }

  void changeOTPSuccesfull(bool state) {
    _otpSuccessfull = state;
    notifyListeners();
  }

  void changeLoginMessage(String? message) {
    _loginMessage = message;
    notifyListeners();
  }

  void changeUserEmail(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void changeAuthOTPSucces(bool state) {
    _authOTPSucces = state;
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
    _verificationLoading = state;
    notifyListeners();
  }
}
