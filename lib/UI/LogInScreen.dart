import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/verification.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import 'SignUpScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static final String logInScreenUrl = "/LogInScreen";

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  var _password = "";

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  Widget _loadingIndicator() {
    return CircularProgressIndicator(
      backgroundColor: Colors.indigo.shade900,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: _provider.isLoginLoading
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
                        "Login Now ",
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
                          "Please login to continue using our app",
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
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                //TODO: send user to forgot password page
                                onTap: () {},
                                child: Text("forgot Password",
                                    style: TextStyle(
                                        color: Colors.indigo.shade900,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo.shade900,
                                  elevation: 10,
                                  padding: EdgeInsets.only(
                                      left: 144,
                                      right: 144,
                                      top: 10,
                                      bottom: 10),
                                ),

                                //TODO: login user and show home screen
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _email = _emailController.value.text;
                                      _password =
                                          _passwordController.value.text;
                                    });
                                    var _userMap =
                                        User().userMap(_email, _password);
                                    print(_userMap);
                                    _provider.changeLoginLoading(true);
                                    await Auth.login(_userMap, context);
                                    print("login button working");
                                    _emailController.clear();
                                    _passwordController.clear();
                                    if (_provider.isLoggedIn) {
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
                                  "Login",
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Dont have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            //TODO: sends user to the signUp screen
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
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
