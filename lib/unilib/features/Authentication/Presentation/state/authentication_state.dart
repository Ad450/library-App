part of 'authentication_cubit.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial(
      {required String error, required UserModel? user}) = _Initial;
  const factory AuthenticationState.loggedIn(
      {required String error, required UserModel? user}) = _LoggedIn;
  const factory AuthenticationState.loading(
      {required String error, required UserModel? user}) = _Loading;
  const factory AuthenticationState.error(
      {required String error, required UserModel? user}) = _Error;
  const factory AuthenticationState.loaded(
      {required String error, required UserModel? user}) = _Loaded;
  const factory AuthenticationState.loggedOut(
      {required String error, required UserModel? user}) = _LoggedOut;
}
