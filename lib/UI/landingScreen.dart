import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 7;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
              
                SizedBox(
                  height: 40,
                ),
                Text("Welcome",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "sign in to continue \n",
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "on Unilib",
                          style: GoogleFonts.quicksand(
                              color: Colors.amberAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
            
                SizedBox(
                  height: 50,
                ),
             
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Or",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
               
                Container(
                  margin: EdgeInsets.only(top: height),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Not registered yet?",
                          style: GoogleFonts.quicksand(
                              color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
