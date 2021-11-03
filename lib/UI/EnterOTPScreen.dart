import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/UI/BookScreen.dart';
import 'package:library_project/Widgets/customPinfield.dart';
import 'package:library_project/unilib/core/platform/app_Images.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  void initState() {
    super.initState();
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
                  style:
                      GoogleFonts.quicksand(fontSize: 20, color: Colors.black),
                ),
                Image.asset(AppAssets.otp),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: CustomPinForm(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookScreen(),
                        ),
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
