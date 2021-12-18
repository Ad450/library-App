import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/utils/assets/app_Images.dart';
import 'package:library_project/unilib/core/widgets/widgets/customPinfield.dart';

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
    return OTP(
      height: _height,
    );
  }
}
//   OTPInitial(height: _height,),

class OTP extends StatelessWidget {
  const OTP({
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
                    onTap: ({required String otpCode}) {},
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
