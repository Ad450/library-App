
import 'dart:async';

import 'package:library_project/unilib/features/Authentication/Presentation/otp/otp_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/otp/otp_state.dart';
import 'package:rxdart/rxdart.dart';

class OTPBloc {
  OTPBloc(){
    _otpEventStream.listen(mapEventToState);
  }

  StreamController<OTPEvents> _otpEventController = BehaviorSubject<OTPEvents>();
  StreamSink<OTPEvents> get otpEventSink => _otpEventController.sink;
  Stream<OTPEvents> get _otpEventStream => _otpEventController.stream;

    StreamController<OTPState> _otpStateController =
      BehaviorSubject<OTPState>();
  StreamSink<OTPState> get _otpStateSink => _otpStateController.sink;
  Stream<OTPState> get otpStateStream => _otpStateController.stream;

  mapEventToState(event){
    if(event is OTPEvents){
      _otpStateSink.add(OTPLoading());

      

    }
  }


  close(){
    _otpEventController.close();
    _otpStateController.close();
  }
}