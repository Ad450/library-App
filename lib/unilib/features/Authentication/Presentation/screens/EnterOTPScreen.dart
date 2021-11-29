import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/Data/platforms/assets/app_Images.dart';
import 'package:library_project/unilib/core/presentation/widgets/customPinfield.dart';
import 'package:library_project/unilib/core/presentation/widgets/retry.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/otp/otp_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/otp/otp_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/otp/otp_state.dart';
import 'package:library_project/unilib/features/books/presentation/screens/BookScreen.dart';
import 'package:provider/provider.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Consumer<OTPBloc>(
      builder: (_, otpBloc, __) => StreamBuilder<OtpState>(
          initialData: OtpState.initial(),
          stream: otpBloc.otpStateStream,
          builder: (_, snapshot) {
            return snapshot.data!.when(
                initial: () => OTPInitial(
                      height: 7,
                    ),
                loading: () => LoadingScreen(),
                loaded: () => BookScreen(),
                error: (error) => Retry(message: error));
          }),
    );
  }
}
//   OTPInitial(height: _height,),

class OTPInitial extends StatelessWidget {
  const OTPInitial({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: _height / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter 5 digit verification code sent to your email",
                  style:
                      GoogleFonts.quicksand(fontSize: 20, color: Colors.black),
                ),
                Image.asset(AppAssets.otp),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: CustomPinForm(
                    onTap: ({required dynamic otpCode}) {
                      Provider.of<OTPBloc>(context, listen: false)
                          .otpEventSink
                          .add(
                            OtpEvent.payload(code: otpCode),
                          );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
