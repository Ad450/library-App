import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:library_project/unilib/core/utils/validator_helpers.dart';
import 'package:library_project/unilib/core/widgets/widgets/customButton.dart';

class CustomPinForm extends StatefulWidget {
  final Function onTap;

  const CustomPinForm({Key? key, required this.onTap}) : super(key: key);

  @override
  _CustomPinFormState createState() => _CustomPinFormState();
}

class _CustomPinFormState extends State<CustomPinForm> {
  String errorText = "please enter missing value(s)";
  //bool _showError = false;

  //bool _otpPinIsNull = false;
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    var _mediaHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Validator.validateOtp(otpCode)
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
            if (Validator.validateOtp(otpCode)) {
              widget.onTap(otpCode: otpCode);
            }
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
          onTap: () {
            if (Validator.validateOtp(otpCode)) {
              widget.onTap(otpCode: otpCode);
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
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

// otp validation logic
// will change to it to a more complex one
