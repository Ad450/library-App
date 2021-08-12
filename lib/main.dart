import 'package:flutter/material.dart';
import 'package:library_project/UI/Books.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

import 'UI/LogInScreen.dart';
import 'UI/SignUpScreen.dart';
import 'UI/verification.dart';
import 'UI/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = "Uenr library";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateProvider(),
      child: MaterialApp(
        routes: {
          SignUpScreen.signUpScreenUrl: (context) => SignUpScreen(),
          LogInScreen.logInScreenUrl: (context) => LogInScreen(),
          VerificationScreen.verificationScreenRoute: (context) =>
              VerificationScreen(),
          BookScreen.booksPageUrl: (context) => BookScreen()
        },
        title: _title,
        home: WelcomeScreen(),
      ),
    );
  }
}
