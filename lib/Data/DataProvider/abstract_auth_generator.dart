abstract class Authentication {
  Future<void> login(Map<String, dynamic> userinfo);
  Future<void> signUp(Map<String, dynamic> userInfo);
  Future<void> getVerificationCode(String email);
  Future<void> getOTPVerification(Map<String, dynamic> userInfo);
}
