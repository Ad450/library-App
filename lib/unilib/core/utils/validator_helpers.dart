const emailPattern = r"[\w_]+@[a-z]+\.[a-z]{2,5}$";
const phoneNumberPattern =
    r'^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d){9,14}\d$';

abstract class Validator {
  static bool validateEmail(String? email) {
    if (email == null) {
      return false;
    }
    try {
      final _emailRegex = RegExp(emailPattern);
      return _emailRegex.hasMatch(email);
    } catch (e) {
      return false;
    }
  }

  static bool validatePassword(String? password) =>
      password != null && password.length > 2;
}
