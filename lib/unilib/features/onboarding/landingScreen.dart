import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/widgets/widgets/customButton.dart';
import 'package:library_project/unilib/core/widgets/widgets/logo.dart';

import 'package:library_project/unilib/features/Authentication/Presentation/screens/LogInScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/signUpScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';
import 'package:library_project/unilib/features/books/presentation/screens/BookScreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 7;
    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (_, state) => state.maybeMap(
            orElse: () {},
            loggedIn: (state) => Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => BookScreen()), (route) => false),
            error: (state) => ScaffoldMessenger.of(_).showSnackBar(SnackBar(content: Text(state.error)))),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 70),
                  const CustomLogo(containerColor: Colors.amberAccent),
                  const SizedBox(height: 40),
                  Text(
                    "Welcome",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "sign in to continue \n",
                          style: GoogleFonts.quicksand(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "on Unilib",
                          style: GoogleFonts.quicksand(
                              color: Colors.amberAccent, fontSize: 30, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      onTap: () => Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false),
                      padding: _mediaQuery.size.longestSide / 6,
                      title: "Login",
                      color: Colors.amberAccent,
                      textColor: Colors.black),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Or",
                      style: GoogleFonts.quicksand(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                            style: GoogleFonts.quicksand(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                            onTap: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                                (route) => false),
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
