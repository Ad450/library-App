import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/SharedPrefs.dart';

import 'package:library_project/Widgets/customButton.dart';
import 'package:library_project/Widgets/logo.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

import 'BookScreen.dart';
import 'landingScreen.dart';
import 'LoginScreen.dart';

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
    final _mediaHeight = MediaQuery.of(context).size.height;
    final _mediaWidth = MediaQuery.of(context).size.width;

    // print(prefIsVerified);
    return widget.prefBool
        ? BookScreen()
        : SafeArea(
            child: PageView(children: [
              Scaffold(
                body: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.amberAccent),
                    ),
                    Positioned(
                      top: _mediaHeight * 0.4,
                      left: _mediaWidth * 0.2,
                      right: _mediaWidth * 0.2,
                      bottom: _mediaHeight * 0.4,
                      child: CustomLogo(),
                    ),                    
                  ],
                ),
              ),

              LandingScreen()
            ]),
          );
  }
}
