import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String loginScreenUrl = "/SignUpScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

 
  @override
  Widget build(BuildContext context) {
   
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 4.5;

   

    return Scaffold(
      // key: _loginScaffoldKey,
      body:Container(),
      );

  }

}