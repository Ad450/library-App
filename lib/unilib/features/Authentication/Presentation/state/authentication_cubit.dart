import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  AuthenticationCubit(this._getVerificationCode, this._login, this._logout,
      this._updateUser, this._verifyCode)
      : super(AuthenticationState.initial(error: "", user: null));
}
