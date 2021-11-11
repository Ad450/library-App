import 'dart:async';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/signIn.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_event.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_state.dart';

class SignUpBloc {
  SignIn _signIn = SignIn(UserRepositoryImpl(RemoteUserSourceImpl()));

  final StreamController<SignUpState> _signUpStateController =
      StreamController();

  StreamSink get _signUpStateSink => _signUpStateController.sink;

  Stream<SignUpState> get signUpStateStream => _signUpStateController.stream;

  final StreamController<SignUpEvents> _signUpEventController =
      StreamController<SignUpEvents>();

  StreamSink<SignUpEvents> get signUpEventSink => _signUpEventController.sink;

  Stream<SignUpEvents> get _signUpEventStream => _signUpEventController.stream;

  SignUpBloc() {
    _signUpEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(event) async {
    if (event is SignUpEvents) {
      _signUpStateSink.add(SignUpState.LOADING);
      print("state is loading");

      Map<String, dynamic> userInfo = {
        "password": event.password,
        "email": event.email
      };

      var result = await _signIn.call(userInfo);
      if (result) {
        _signUpStateSink.add(SignUpState.LOADED);
      } else {
        _signUpStateSink.add(SignUpState.ERROR);
      }
    }
  }

  close() {
    _signUpStateController.close();
    _signUpEventController.close();
  }
}


// events for signing up a user
