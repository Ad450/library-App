
import 'package:freezed_annotation/freezed_annotation.dart';

part "login_events.freezed.dart";

@freezed
abstract class LoginEvent with _$LoginEvent{
 factory LoginEvent.payload({required String email, required String password}) = _Payload;
}