import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Bloc/learningBloc.dart';
import 'package:library_project/UI/GiveDetailScreen.dart';

import 'package:library_project/UI/SignUpScreen.dart';

import 'package:library_project/Widgets/customButton.dart';
import 'package:library_project/Widgets/logo.dart';

import 'LoginScreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 7;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<TrialButton>(
          create: (context) => TrialButton(),
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  CustomLogo(
                    containerColor: Colors.amberAccent,
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
                  // ...............................
                  //...............................
                  // ..............................
                  // BlocBuilder(builder: (context))
                  BlocConsumer(
                    bloc: TrialButton(),
                    listener: (context, state) => print("is listening"),
                    builder: (context, stateObject) => Row(
                      children: [
                        Text(
                          TrialButton().state.toString(),
                        ),
                        TextButton(
                            child: Text("+"),
                            onPressed: () => TrialButton().increment),
                        TextButton(
                            child: Text("-"),
                            onPressed: () => TrialButton().decrement)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              //TODO: navigating to login page...just testing the GiveDetailsScreen
                              builder: (context) => LoginScreen())),
                      padding: _mediaQuery.size.longestSide / 6,
                      title: "Login",
                      color: Colors.amberAccent,
                      textColor: Colors.black),
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
                  CustomButton(
                      //TODO: login with google here
                      onTap: () {},
                      padding: _mediaQuery.size.longestSide / 14,
                      title: "Login with Google",
                      color: Colors.lightBlue[100],
                      textColor: Colors.lightBlue[900]),
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
                        CustomButton(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen())),
                            padding: _mediaQuery.size.longestSide / 14,
                            title: "Create an Account",
                            color: Colors.grey[800],
                            textColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
