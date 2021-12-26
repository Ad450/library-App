import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/utils/assets/app_Images.dart';
import 'package:library_project/unilib/core/utils/validator_helpers.dart';
import 'package:library_project/unilib/core/widgets/widgets/customPinfield.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/complete_signup.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  var _email = "";
  late String otpCode;

  void verifyOtp(String code) {
    FocusScope.of(context).unfocus();
    if (mounted) {
      if (Validator.validateOtp(code)) {
        BlocProvider.of<AuthenticationCubit>(context).verifyCode(email: _email, code: code);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    final _user = context.read<AuthenticationCubit>().state.user;
    if (_user != null) {
      _email = _user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
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
                  style: GoogleFonts.quicksand(fontSize: 20, color: Colors.black),
                ),
                Image.asset(AppAssets.otp),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: BlocListener<AuthenticationCubit, AuthenticationState>(
                    listener: (_, state) => state.maybeMap(
                      orElse: () {},
                      error: (state) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      ),
                      loaded: (state) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CompleteSignUpScreen(),
                        ),
                        (route) => false,
                      ),
                    ),
                    child: CustomPinForm(
                      onTap: ({required String otpCode}) => verifyOtp(otpCode),
                      getOtp: (code) => otpCode = code,
                    ),
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
