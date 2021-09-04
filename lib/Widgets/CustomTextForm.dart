import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/UI/GiveDetailScreen.dart';
import 'package:library_project/Widgets/customButton.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

class CustomTextForm extends StatefulWidget {
  final String? _email;
  const CustomTextForm({Key? key, String? email})
      : _email = email,
        super(key: key);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  String errorText = "please enter missing value(s)";
  //bool _showError = false;

  bool _otpPinIsNull = false;
  String otpCode = "";
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // List<Widget> _otpTextField = [];

  // List<Map<dynamic, TextEditingController>> _controllers = [
  //   {
  //     1: TextEditingController(),
  //     2: TextEditingController(),
  //     3: TextEditingController(),
  //     4: TextEditingController(),
  //     5: TextEditingController()
  //   }
  // ];
  // List<Widget> returnOTPFields() {
  //   for (var i = 1; i < 6; i++) {
  //     _otpTextField.add(_customTextField(_controllers[0][i]));
  //   }
  //   return _otpTextField;
  // }

  // Widget _customTextField(TextEditingController? _controller) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 10),
  //     width: 50,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border(
  //           top: BorderSide(
  //             color: Colors.amberAccent,
  //           ),
  //           left: BorderSide(
  //             color: Colors.amberAccent,
  //           ),
  //           right: BorderSide(
  //             color: Colors.amberAccent,
  //           ),
  //           bottom: BorderSide(
  //             color: Colors.amberAccent,
  //           )),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: TextFormField(
  //         validator: (String? inputText) {
  //           if (inputText == null && inputText == "") {
  //             return "please enter digit ";
  //           }
  //           return null;
  //         },
  //         keyboardType: TextInputType.multiline,
  //         decoration: InputDecoration(
  //             errorBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.red))),
  //         controller: _controller),
  //   );
  // }

  Future<void> _verifyOTP(String code, BuildContext context) async {
    var _stateProvider = Provider.of<StateProvider>(context, listen: false);
    if (code.length != 5) {
      setState(() {
        _otpPinIsNull = true;
      });
    } else {
      setState(() {
        _otpPinIsNull = false;
        code = "";
      });
    }
    _stateProvider.changeOTPLoading(true);

    assert(widget._email != null);
    await Auth.otpVerification(widget._email!, code, context);
      
    if (_stateProvider.otpSuccesfull) {
      print("function got here");
      Navigator.popAndPushNamed(context, GiveDetailsScreen.detailsUrl);
    } else {
      setState(() {
        errorText = _stateProvider.otpMessage;
      });
    }
    // print(widget._email);
    // print(code);
  }

  @override
  void initState() {
    print(widget._email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _stateProvider = Provider.of<StateProvider>(context);
    var _mediaHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.asset(Constants.otpImage),
        _otpPinIsNull
            ? Text(
                errorText,
                style: GoogleFonts.quicksand(fontSize: 20, color: Colors.red),
              )
            : Text(""),
        SizedBox(height: 10),
        OtpTextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              fillColor: Colors.amberAccent, focusColor: Colors.amberAccent),
          numberOfFields: 6,
          borderColor: Colors.amberAccent,
          cursorColor: Colors.amberAccent,
          enabledBorderColor: Colors.amberAccent,
          margin: EdgeInsets.all(10),
          onCodeChanged: (String pin) {},
          onSubmit: (String code) {
            setState(() {
              otpCode = code;
              code = "";
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          title: "verify",
          color: Colors.amberAccent,
          textColor: Colors.black,
          padding: 6,
          onTap: () => _verifyOTP(otpCode, context),
        ),
        SizedBox(
          height: 10,
        ),
        _stateProvider.otpLoading
            ? LinearProgressIndicator(
                color: Colors.amberAccent,
              )
            : Container(),
        Container(
          margin: EdgeInsets.only(top: _mediaHeight / 9),
          child: Text(
            "unilib",
            style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ],
    );
  }
}


// store a boolean in sharedPreferences named isProfile filled to show either the profile or the homePage
