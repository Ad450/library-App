import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verfication_state.dart';
import 'dart:async';

import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_event.dart';


class VerificationBloc {
  GetVerificationCode _getVerificationCode =
      GetVerificationCode(UserRepositoryImpl(RemoteUserSourceImpl()));

  StreamController<VerificationState> _verificationStateController =
      StreamController<VerificationState>();
  StreamSink<VerificationState> get _verificationStateSink =>
      _verificationStateController.sink;
  Stream<VerificationState> get verificationStateStream =>
      _verificationStateController.stream;

  StreamController<VerificationEvent> _verificationEventController =
      StreamController<VerificationEvent>();
  StreamSink<VerificationEvent> get verificationEventSink =>
      _verificationEventController.sink;
  Stream<VerificationEvent> get _verificationEventStream =>
      _verificationEventController.stream;

  VerificationBloc() {
    _verificationEventStream.listen(_mapEventToState);
  }

  _mapEventToState(event) async {
    if (event is VerificationState) {
      print("function is in verification bloc");
      
      _verificationStateSink.add(VerificationState.LOADING);

      var result = await _getVerificationCode.call(null);

      if (result) {
        _verificationStateSink.add(VerificationState.LOADED);
      } else {
        _verificationStateSink.add(VerificationState.ERROR);
      }
    }
  }

  close() {
    _verificationStateController.close();
    _verificationEventController.close();
  }
}
