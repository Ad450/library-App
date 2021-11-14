
abstract class OTPEvents{}

class SendOTPEvent extends OTPEvents{
  String code;
  SendOTPEvent({required this.code});
}

