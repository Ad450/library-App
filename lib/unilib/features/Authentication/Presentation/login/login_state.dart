
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';


@freezed
abstract class LoginState with _$LoginState{
  factory LoginState.initial() = _Initial;
  factory LoginState.loading() = _Loading;
  factory LoginState.loaded() = _Loaded;
  factory LoginState.error({required String email}) = _Error;
}