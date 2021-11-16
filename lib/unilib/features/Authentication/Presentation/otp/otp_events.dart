
abstract class OTPEvents{
  String code;
  OTPEvents({required this.code});
}

class SendOTPEvent extends OTPEvents{
  String code;
  SendOTPEvent({required this.code}):super(code: code);
}

