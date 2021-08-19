import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/constants/constants.dart';

class LoadingScreen extends StatelessWidget {
  final String? _authTitle;
  const LoadingScreen({Key? key, String? authTitle})
      : _authTitle = authTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 3.9;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                "Almost done",
                style: GoogleFonts.quicksand(color: Colors.black, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                _authTitle ?? "please wait while we make final touches",
                style: GoogleFonts.quicksand(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(Constants.waitingImage),
            SizedBox(
              height: 50,
            ),
            LinearProgressIndicator(
              color: Colors.amberAccent,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: height),
              child: Text("unilib",
                  style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2)),
            ),
          ]),
        ),
      ),
    );
  }
}
