import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  factory OtpState.initial() = _Initial;
  factory OtpState.loading() = _Loading;
  factory OtpState.loaded() = _Loaded;
  factory OtpState.error({required String errorMessage}) = _Error;
}
