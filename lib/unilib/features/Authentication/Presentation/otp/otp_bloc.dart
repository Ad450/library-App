import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:library_project/unilib/core/Data/database/email_db.dart';
import 'package:library_project/unilib/core/Data/network/network_service.dart';
import 'package:library_project/unilib/core/util.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_dataSources/remote_user_impl.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verifyCode.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/otp/otp_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/otp/otp_state.dart';
import 'package:rxdart/rxdart.dart';

class OTPBloc {
  EmailDatabase _emailDatabase = EmailDatabase();
  VerifyCode _verifyCode = VerifyCode(
      UserRepositoryImpl(RemoteUserSourceImpl(NetworkServiceImpl())));
  OTPBloc() {
    _otpEventStream.listen(mapEventToState);
  }

  StreamController<OtpEvent> _otpEventController = BehaviorSubject<OtpEvent>();
  StreamSink<OtpEvent> get otpEventSink => _otpEventController.sink;
  Stream<OtpEvent> get _otpEventStream => _otpEventController.stream;

  StreamController<OtpState> _otpStateController = BehaviorSubject<OtpState>();
  StreamSink<OtpState> get _otpStateSink => _otpStateController.sink;
  Stream<OtpState> get otpStateStream => _otpStateController.stream;

  mapEventToState(event) async {
    _otpStateSink.add(OtpState.initial());
    if (event is OtpEvent) {
      _otpStateSink.add(OtpState.loading());

      String email = await _emailDatabase.retrieveCurrentItem(emailCollection);
      final result = await _verifyCode.call(event.code, email: email);
      result.fold(
          (l) => _otpStateSink.add(OtpState.error(errorMessage: l.message)),
          (r) => OtpState.loading());
    }
  }

  close() {
    _otpEventController.close();
    _otpStateController.close();
  }
}


// class OTPBloc extends Bloc<OtpEvent, OtpState>{
//   OTPBloc():super(OTPInitial());
//   @override
//   Stream<OtpState> mapEventToState(OtpEvent event) {
//     // TODO: implement mapEventToState
//     throw UnimplementedError();
//   }

// }