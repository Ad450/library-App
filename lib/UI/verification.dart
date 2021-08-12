import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
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
    return CircularProgressIndicator(backgroundColor: Colors.indigo.shade900);
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: _provider.verificationLoading
              ? _loadingIndicator()
              : Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 50),
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Please verify your email",
                            style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset(Constants.secondScreenUrl),
                        SizedBox(
                          height: 50,
                        ),
                        Card(
                          elevation: 15,
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.always,
                            cursorColor: Colors.indigo.shade900,
                            validator: (input) {
                              if (input!.isEmpty) {
                                return "please enter your email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "enter email",
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.only(left: 20),
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.indigo.shade900),
                            ),
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
                                  left: 120, right: 120, top: 10, bottom: 10),
                            ),
                            //TODO: verify user
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  _email = _emailController.value.text;
                                });
                                Map<String, dynamic> _userMap =
                                    User().getUserMapFromVerification(_email)!;
                                _provider.changeVerificationLoadingState(true);
                                await Auth.getVerification(_userMap, context);

                                print("is validated");
                              }
                            },
                            child: Text(
                              "verify",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
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
