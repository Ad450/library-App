import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:library_project/unilib/core/Data/network/network_service.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/login/login_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/login/login_state.dart';
import 'package:rxdart/rxdart.dart';

// class LoginBloc extends Cubit<LoginState> {
//   Login _login =
//       Login(UserRepositoryImpl(RemoteUserSourceImpl(NetworkServiceImpl())));
//   LoginBloc() : super(LoginState.initial());

//   Future<void> login(LoginEvent event) async {
//     emit(LoginState.loading());
//     print("${event.email}....${event.password}");
//     Map<String, dynamic> _userInfo = {
//       "email": event.email,
//       "password": event.password
//     };
//     var result = await _login.call(_userInfo);
//     result.fold((l) => emit(LoginState.error(email: l.message)),
//         (r) => emit(LoginState.loaded()));
//   }
// }

class LoginBloc {
  Login _login =
      Login(UserRepositoryImpl(RemoteUserSourceImpl(NetworkServiceImpl())));

  StreamController<LoginState> _loginStateController =
      BehaviorSubject<LoginState>();
  Stream<LoginState> get loginStateStream => _loginStateController.stream;
  StreamSink get _loginStateSink => _loginStateController.sink;

  StreamController<LoginState> _loginEventController =
      BehaviorSubject<LoginState>();
  StreamSink get loginEventSink => _loginEventController.sink;
  Stream get _loginEventSteam => _loginEventController.stream;

  LoginBloc() {
    _loginEventSteam.listen(mapEventToStream);
  }

  mapEventToStream(event) async{
    _loginStateSink.add(LoginState.initial());
    if (event is LoginEvent) {
      _loginStateSink.add(LoginState.loading());

      Map<String, dynamic> _userInfo = {
        "email": event.email,
        "password": event.password
      };

          var result = await _login.call(_userInfo);
    result.fold((l) => _loginStateSink.add(LoginState.error(email: l.message)),
        (r) => _loginStateSink.add(LoginState.loaded()));

    }
  }

  close() {
    _loginStateController.close();
    _loginEventController.close();
  }
}
