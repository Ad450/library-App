import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/EnterOTPScreen.dart';

import 'package:library_project/UI/LoadingScreen.dart';
import 'package:library_project/Widgets/customButton.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  static final verificationScreenRoute = "/verificationUrl";

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? _email = "";

  Widget _loadingIndicator() {
    return Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(backgroundColor: Colors.indigo.shade900),
      ),
    );
  }

  void disposeDialog() {
    Navigator.pop(context);
  }

  Future<void> _showDialog(String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        content: Text("please try again"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: disposeDialog,
          ),
        ],
      ),
    );
  }

  void _handleVerification(StateProvider _provider) async {
    if (_key.currentState!.validate()) {
      setState(() {
        _email = _emailController.value.text;
      });
      _provider.changeUserEmail(_email!);
      Map<String, dynamic> _userMap =
          User().getUserMapFromVerification(_email)!;
      _provider.changeVerificationLoadingState(true);

      await Auth.getVerification(_userMap, context);

      //   _emailController.clear();
      print("is validated");

      if (_provider.isVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EnterOTPScreen(email: _email),
          ),
        );
      } else if (_provider.verificationMessage != null) {
        _showDialog(_provider.verificationMessage!);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 6;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: _provider.verificationLoading
              ? LoadingScreen(
                  authTitle: "please wait while we verify your account",
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please verify your email",
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Image.asset(Constants.verifyImage),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.amberAccent,
                            validator: (input) {
                              if (input!.isEmpty) {
                                return "please enter your email";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  GoogleFonts.quicksand(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.amberAccent)),
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.amberAccent),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            title: "verify ",
                            color: Colors.amberAccent,
                            textColor: Colors.black,
                            padding: 7,
                            onTap: () => _handleVerification(_provider),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height),
                            child: Text("unilib",
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
