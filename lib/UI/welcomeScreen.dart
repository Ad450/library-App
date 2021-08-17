import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/SharedPrefs.dart';
import 'package:library_project/UI/Books.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

import 'LogInScreen.dart';
import 'SignUpScreen.dart';

class WelcomeScreen extends StatefulWidget {
  final bool prefBool;
  const WelcomeScreen(this.prefBool);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SharedPrefs _sharedPrefs = SharedPrefs();

  // trying to get the value before build method is called

  @override
  Widget build(BuildContext context) {
    // _provider gives the value of isVerified....check auth class ..handleVerification
   // print(widget.prefBool);
    var _provider = Provider.of<StateProvider>(context);
    _sharedPrefs.setBookScreen(_provider.isVerified);

    // print(prefIsVerified);
    return widget.prefBool
        ? GiveDetailsScreen()
        : Scaffold(
            backgroundColor: Constants.color,
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900,
                        fontSize: 30,
                      
                      )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please login or sign up to continue using our app",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(Constants.firstScreenUrl),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter via Social Networks",
                        style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Card(
                              borderOnForeground: true,
                              elevation: 10,
                              shape: CircleBorder(),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          CircleBorder()),
                                ),
                                child: Image.asset(
                                  Constants.googleImage,
                                  height: 30,
                                  width: 20,
                                ),
                                // TODO: this handler will authenticate user using google auth
                                onPressed: () {},
                              ),
                            ),
                            Card(
                              borderOnForeground: true,
                              elevation: 20,
                              shape: CircleBorder(),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(CircleBorder())),
                                child: Icon(Icons.facebook,
                                    color: Colors.indigo.shade900),
                                // TODO: this handler will authenticate user using facebook auth
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "or login with",
                        style: TextStyle(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "email",
                        style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade900,
                          elevation: 10,
                          padding: EdgeInsets.only(
                              left: 120, right: 120, top: 10, bottom: 10),
                        ),
                        //TODO: sends user to sign up screen
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "You already have account an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
