import 'package:bloc/bloc.dart';
import 'package:library_project/unilib/core/Data/network/network_service.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/login/login_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  Login _login =
      Login(UserRepositoryImpl(RemoteUserSourceImpl(NetworkServiceImpl())));
  LoginBloc() : super(LoginState.initial());

  Future<void> login(LoginEvent event) async {
    emit(LoginState.loading());
    print("${event.email}....${event.password}");
    Map<String, dynamic> _userInfo = {
      "email": event.email,
      "password": event.password
    };
    var result = await _login.call(_userInfo);
    result.fold((l) => emit(LoginState.error(email: l.message)),
        (r) => emit(LoginState.loaded()));
  }
}
