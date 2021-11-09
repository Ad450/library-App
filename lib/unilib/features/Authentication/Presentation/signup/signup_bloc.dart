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

  final _signUpEventController = StreamController();

  StreamSink get signUpEventSink => _signUpEventController.sink;

  Stream get _signUpEventStream => _signUpEventController.stream;

  // StreamController _userInfoController  = StreamController();

  // Stream get _getUserInfoStream => _userInfoController.stream;

  // StreamSink get inputUserInfoSink => _userInfoController.sink;

  SignUpBloc() {
    _signUpEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(event) async {
    if (event is SignUpEvents) {
      _signUpStateSink.add(SignUpState.LOADING);
      print("event sent");
    }
  }

  close() {
    _signUpStateController.close();
    _signUpEventController.close();
  }
}


// events for signing up a user
