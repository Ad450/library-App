import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/platform/app_Images.dart';
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
 
  @override
  Widget build(BuildContext context) {
   
    final _mediaHeight = MediaQuery.of(context).size.height;
    final _mediaWidth = MediaQuery.of(context).size.width;

    return
        
        SafeArea(
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

class CustomLogo extends StatelessWidget {
  const CustomLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : CircleAvatar(
        child: Image.asset(AppAssets.logo),
      ) ,
    );
  }
}