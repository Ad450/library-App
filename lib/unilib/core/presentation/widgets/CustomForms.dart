import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/presentation/widgets/customButton.dart';
import 'package:library_project/unilib/core/presentation/widgets/logo.dart';

import 'package:library_project/unilib/features/Authentication/Presentation/screens/verification.dart';

class CustomForms extends StatefulWidget {
  final String title;
  final String buttonTitle;
  final double paddingDecider;
  final Function onTap;
  const CustomForms(
      {Key? key,
      required this.buttonTitle,
      required this.title,
      required this.paddingDecider,
      required this.onTap})
      : super(key: key);

  @override
  _CustomFormsState createState() => _CustomFormsState();
}

class _CustomFormsState extends State<CustomForms> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
// bool _customFormStateMounted = _CustomFormsState().mounted;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 4.5;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                CustomLogo(
                  containerColor: Colors.amberAccent,
                ),
                SizedBox(height: 40),
                Container(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.quicksand(
                        color: Colors.black, fontSize: 30),
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
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
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        cursorColor: Colors.amberAccent,
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
                                color: Colors.amberAccent,
                              )),
                          labelText: "password",
                          labelStyle:
                              GoogleFonts.quicksand(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // Post to VerificationScreen()...just testing with OTPScreen()
                                builder: (context) => VerificationScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "resend verification code",
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        title: widget.buttonTitle,
                        color: Colors.amberAccent,
                        textColor: Colors.black,
                        padding: _mediaQuery.size.longestSide /
                            widget.paddingDecider,
                        onTap: () async {
                          if (_formKey.currentState!.validate())
                            widget.onTap(
                                password: _passwordController.value.text,
                                email: _emailController.value.text);
                        },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
