import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EnterOTPScreen extends StatefulWidget {

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: _height / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter 5 digit verification code sent to your email",
                  style:
                      GoogleFonts.quicksand(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   child: CustomTextForm(email: widget._email),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
