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

  StreamController<OTPEvents> _otpEventController =
      BehaviorSubject<OTPEvents>();
  StreamSink<OTPEvents> get otpEventSink => _otpEventController.sink;
  Stream<OTPEvents> get _otpEventStream => _otpEventController.stream;

  StreamController<OTPState> _otpStateController = BehaviorSubject<OTPState>();
  StreamSink<OTPState> get _otpStateSink => _otpStateController.sink;
  Stream<OTPState> get otpStateStream => _otpStateController.stream;

  mapEventToState(event) async {
    if (event is OTPEvents) {
      _otpStateSink.add(OTPLoading());

      String email = await _emailDatabase.retrieveCurrentItem(emailCollection);
      final result = await _verifyCode.call(event.code, email: email);
      result.fold((l) => _otpStateSink.add(OTPError()), (r) => OTPLoaded());
    }
  }

  close() {
    _otpEventController.close();
    _otpStateController.close();
  }
}


// class OTPBloc extends Bloc<OTPEvents, OTPState>{
//   OTPBloc():super(OTPInitial());
//   @override
//   Stream<OTPState> mapEventToState(OTPEvents event) {
//     // TODO: implement mapEventToState
//     throw UnimplementedError();
//   }

// }