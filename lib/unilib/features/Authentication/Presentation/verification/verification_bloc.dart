import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verfication_state.dart';
import 'dart:async';

import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_event.dart';
import 'package:library_project/unilib/features/books/Data/data_sources/remote_dataSources/remote_book_source_impl.dart';

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
    print("function is in verification bloc");
    if (event is VerificationState) {
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

class TypeParam extends NoParam {}
