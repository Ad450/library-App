import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/verification.dart';
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
              ]);
        });
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
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Please Register with email and sign up to continue using our app",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              height: 1),
                        ),
                      ),
                      SizedBox(
                        height: 80,
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  CircleBorder(),
                                ),
                              ),
                              child: Icon(Icons.facebook,
                                  color: Colors.indigo.shade900),
                              // TODO: this handler will authenticate user using facebook auth
                              onPressed: () {},
                            ),
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
                                    setState(() {
                                      _email = _emailController.value.text;
                                      _password =
                                          _passwordController.value.text;
                                    });
                                    var _userMap =
                                        User().userMap(_email, _password);

                                    _provider.changeSignUpLoading(true);
                                    print("$_userMap");
                                    await Auth.signUp(_userMap, context);
                                    _emailController.clear();
                                    _passwordController.clear();

                                    if (_provider.getAuthMessage != null) {
                                      _showDialog(
                                          context, _provider.getAuthMessage!);
                                    }

                                    if (_provider.hasSignedUp) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationScreen(),
                                        ),
                                      );
                                    }
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

// class CustomElevatedButton extends StatefulWidget {
//   CustomElevatedButton({Key? key, this.formKey, this.emailController}) : super(key: key);
//   final GlobalKey? formKey;
//   final TextEditingController? emailController;

//   @override
//   _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
// }

// class _CustomElevatedButtonState extends State<CustomElevatedButton> {
//   String? email;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.indigo.shade900,
//         elevation: 10,
//         padding: EdgeInsets.only(left: 110, right: 110, top: 10, bottom: 10),
//       ),
//
//       onPressed: () async {

//        if (widget.formKey.currentState!.validate()) {
//           // sign user
//           setState(() {
//             email = widget.emailController.value.text ?? "";
//             widget.password = _passwordController.value.text;
//           });
//           User _user = User(email: _email, password: _password);
//           await Auth.signUpUser(_user);
//           print("sent");
//           _emailController.clear();
//           _passwordController.clear();

//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => VerificationScreen(),
//             ),
//           );
//         }
//       },
//       child: Text(
//         "Sign up",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//           letterSpacing: 1,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
