abstract class Events {}

class VerificationEvent extends Events {
  String email;
  VerificationEvent({required this.email});

  factory VerificationEvent.withEmail({required String email}) =>
      VerificationEvent(email: email);
}
