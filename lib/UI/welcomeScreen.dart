import 'package:flutter/material.dart';
import 'package:library_project/SharedPrefs.dart';
import 'package:library_project/UI/GiveDetailScreen.dart';
import 'package:library_project/Widgets/logo.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

import 'landingScreen.dart';

class WelcomeScreen extends StatefulWidget {
  final bool isVerified;
  final bool isLoggedIn;
  const WelcomeScreen(this.isVerified, this.isLoggedIn);
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

    final _mediaHeight = MediaQuery.of(context).size.height;
    final _mediaWidth = MediaQuery.of(context).size.width;

    // print(prefIsVerified);
    return widget.isVerified
        // || widget.isLoggedIn
        ? GiveDetailsScreen()
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
