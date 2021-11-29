abstract class Events {}

class SignUpEvents extends Events {
  String email;
  String password;

  SignUpEvents({required this.email, required this.password});

  factory SignUpEvents.containUserInfo(
      {required String email, required String name}) {
    return SignUpEvents(email: email, password: name);
  }
}
