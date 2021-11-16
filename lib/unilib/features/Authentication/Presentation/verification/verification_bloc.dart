import 'package:library_project/unilib/core/Data/database/email_db.dart';
import 'package:library_project/unilib/core/Data/network/network_service.dart';
import 'package:library_project/unilib/core/domain/usecases/no_param.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verfication_state.dart';
import 'dart:async';

import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_event.dart';

class VerificationBloc {
  GetVerificationCode _getVerificationCode = GetVerificationCode(
      UserRepositoryImpl(RemoteUserSourceImpl(NetworkServiceImpl())));
  EmailDatabase _emailDatabase = EmailDatabase();

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
    print("bloc is initialised");
  }

  _mapEventToState(event) async {
    print("function is in verification map");
    if (event is VerificationEvent) {
      print("function is in verification bloc");

      _verificationStateSink.add(VerificationLoading());

      print(event.email);
      Map<String, dynamic> userInfo = {"email": event.email};
      _emailDatabase.store(emailCollection, event.email);
      print(userInfo);
      var result = await _getVerificationCode.call(userInfo);

      result.fold(
        (l) => _verificationStateSink.add(VerificationError(l.message)),
        (r) => _verificationStateSink.add(VerificationLoaded()),
      );
    }
  }

  close() {
    _verificationStateController.close();
    _verificationEventController.close();
  }
}
