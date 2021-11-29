import 'package:freezed_annotation/freezed_annotation.dart';
part 'otp_events.freezed.dart';

@freezed
abstract class OtpEvent with _$OtpEvent {
  factory OtpEvent.payload({required String code}) = _OtpEventpayload;
}
