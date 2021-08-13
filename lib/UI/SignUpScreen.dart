import 'dart:html';

import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/verification.dart';
import 'package:library_project/Widgets/SignUpWidget.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import 'LogInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String signUpScreenUrl = "/SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  Widget _loadingIndicator() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.indigo.shade900,
        ),
      ),
    );
  }

  void _closeDialog() {
    Navigator.pop(context);
  }

  Future<dynamic> _showDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          content: Text("please try again"),
          actions: <Widget>[
            TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.indigo.shade900),
                ),
                onPressed: () => _closeDialog())
          ],
        );
      },
    );
  }

  void _handleSignUp(dynamic _provider) async {
    if (_formKey.currentState!.validate()) {
      // sign user
      setState(() {
        _email = _emailController.value.text;
        _password = _passwordController.value.text;
      });
      var _userMap = User().userMap(_email, _password);

      _provider.changeSignUpLoading(true);
      print("$_userMap");
      await Auth.signUp(_userMap, context);
      _emailController.clear();
      _passwordController.clear();

      if (_provider.getAuthMessage != null) {
        _showDialog(context, _provider.getAuthMessage!);
      }

      if (_provider.hasSignedUp) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: _provider.isAuthLoading
            ? _loadingIndicator()
            : Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      SignUpWidget(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Card(
                              elevation: 15,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.indigo.shade900,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return "please enter your email";
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "enter email",
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.indigo.shade900),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 15,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                cursorColor: Colors.indigo.shade900,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return "please enter your password";
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.remove_red_eye_sharp
                                            : Icons.remove_red_eye_outlined,
                                        color: Colors.indigo.shade900,
                                      )),
                                  border: InputBorder.none,
                                  hintText: "enter password",
                                  contentPadding:
                                      EdgeInsets.only(left: 20, top: 14),
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.indigo.shade900),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo.shade900,
                                  elevation: 10,
                                  padding: EdgeInsets.only(
                                      left: 135,
                                      right: 135,
                                      top: 10,
                                      bottom: 10),
                                ),
                                //TODO: sends user to verification screen after sign up
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // sign user
                                    _handleSignUp(_provider);
                                  }
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
      ),
    );
  }
}
