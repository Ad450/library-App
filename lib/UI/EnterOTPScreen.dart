import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Widgets/CustomTextForm.dart';

class EnterOTPScreen extends StatefulWidget {
  final String? _email;
  const EnterOTPScreen({Key? key, String? email})
      : _email = email,
        super(key: key);

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  void initState() {
    print(widget._email);
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
            margin: EdgeInsets.only(left: 30, right: 30, top: _height / 10),
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
                Container(
                  alignment: Alignment.center,
                  child: CustomTextForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
