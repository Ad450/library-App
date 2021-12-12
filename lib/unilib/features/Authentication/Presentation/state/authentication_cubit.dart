import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/check_login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/update_user.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verifyCode.dart';
import '../../Data/Models/user_model/user_model.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final Login _login;
  final GetVerificationCode _getVerificationCode;
  final UpdateUser _updateUser;
  final VerifyCode _verifyCode;
  final Logout _logout;
  final CheckLogin _checkLogin;

  AuthenticationCubit(this._getVerificationCode, this._login, this._logout,
      this._updateUser, this._verifyCode, this._checkLogin)
      : super(AuthenticationState.initial(error: "", user: null));

  Future<void> login(String email, String password) async {
    emit(AuthenticationState.loading(error: state.error, user: state.user));

    final _result =
        await _login.call(LoginParam(email: email, password: password));
    _result.fold(
        (l) =>
            emit(AuthenticationState.error(error: l.message, user: state.user)),
        (r) => emit(AuthenticationState.loaded(error: state.error, user: r)));
  }

  Future<void> getVerificationCode(
      {required String email, required String password}) async {
    emit(AuthenticationState.loading(error: state.error, user: state.user));

    final _result = await _getVerificationCode
        .call(GetVerificationCodeParam(email: email, password: password));
    _result.fold(
        (l) =>
            emit(AuthenticationState.error(user: state.user, error: l.message)),
        (r) => emit(
            AuthenticationState.loaded(error: state.error, user: state.user)));
  }

  Future<void> updateUser(
      {required String email,
      required String oldPassword,
      required String newPassword,
      required String name,
      required String id}) async {
    emit(AuthenticationState.loading(user: state.user, error: state.error));

    final _result = await _updateUser.call(UpdateUserParam(
        email: email,
        oldPassword: oldPassword,
        name: name,
        newPassword: newPassword,
        id: id));
    _result.fold(
        (l) =>
            emit(AuthenticationState.error(error: l.message, user: state.user)),
        (r) => emit(AuthenticationState.loaded(error: state.error, user: r)));
  }

  Future<void> verifyCode({required String email, required String code}) async {
    emit(AuthenticationState.loading(error: state.error, user: state.user));

    final _result =
        await _verifyCode.call(VerifyCodeParam(code: code, email: email));
    _result.fold(
        (l) => emit(
              AuthenticationState.error(error: l.message, user: state.user),
            ),
        (r) => emit(
            AuthenticationState.loaded(user: state.user, error: state.error)));
  }

  Future<void> logout() async {
    emit(AuthenticationState.loading(error: state.error, user: state.user));

    final _result = await _logout.call(const NoParam());

    _result.fold(
        (l) =>
            emit(AuthenticationState.error(error: l.message, user: state.user)),
        (r) =>
            AuthenticationState.loaded(error: state.error, user: state.user));
  }

  Future<void> checkLogin() async {
    emit(AuthenticationState.loading(error: state.error, user: state.user));

    final _result = await _checkLogin.call(const NoParam());
    _result.fold(
        (l) =>
            emit(AuthenticationState.error(error: l.message, user: state.user)),
        (r) {
      if (r != null) {
        emit(AuthenticationState.loggedIn(error: state.error, user: r));
      } else {
        emit(AuthenticationState.loaded(user: state.user, error: state.error));
      }
    });
  }
}
