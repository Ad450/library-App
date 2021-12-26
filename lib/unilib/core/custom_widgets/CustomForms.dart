import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/utils/validator_helpers.dart';
import 'package:library_project/unilib/core/custom_widgets/customButton.dart';
import 'package:library_project/unilib/core/custom_widgets/logo.dart';

class SignUpCustomForms extends StatefulWidget {
  final String title;
  final String buttonTitle;
  final double paddingDecider;
  final Function onTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool loading;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

  const SignUpCustomForms(
      {Key? key,
      required this.buttonTitle,
      required this.title,
      required this.paddingDecider,
      required this.onTap,
      required this.emailController,
      required this.passwordController,
      required this.emailFocus,
      required this.passwordFocus,
      this.loading = false,
      required this.formKey})
      : super(key: key);

  @override
  _SignUpCustomFormsState createState() => _SignUpCustomFormsState();
}

class _SignUpCustomFormsState extends State<SignUpCustomForms> {
  bool _obscureText = true;
// bool _customFormStateMounted = _CustomFormsState().mounted;

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
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
                    style: GoogleFonts.quicksand(color: Colors.black, fontSize: 30),
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: widget.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        focusNode: widget.emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.amberAccent,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return "please enter your email";
                          }
                          return Validator.validateEmail(email) ? null : "invalid email";
                        },
                        controller: widget.emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: GoogleFonts.quicksand(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)),
                          hintStyle: TextStyle(fontSize: 15, color: Colors.amberAccent),
                        ),
                        onEditingComplete: widget.passwordFocus.requestFocus,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        focusNode: widget.passwordFocus,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        cursorColor: Colors.amberAccent,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "please enter your password";
                          }
                          return Validator.validatePassword(password) ? null : "invalid password";
                        },
                        controller: widget.passwordController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText ? Icons.remove_red_eye_sharp : Icons.remove_red_eye_outlined,
                                color: Colors.amberAccent,
                              )),
                          labelText: "password",
                          labelStyle: GoogleFonts.quicksand(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)),
                        ),
                        onEditingComplete: () => widget.onTap,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "resend verification code",
                            style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      widget.loading
                          ? CircularProgressIndicator(
                              color: Colors.amberAccent,
                            )
                          : CustomButton(
                              title: widget.buttonTitle,
                              color: Colors.amberAccent,
                              textColor: Colors.black,
                              padding: _mediaQuery.size.longestSide / widget.paddingDecider,
                              onTap: () async {
                                if (widget.formKey.currentState!.validate())
                                  widget.onTap(
                                      password: widget.passwordController.value.text,
                                      email: widget.emailController.value.text);
                              },
                            ),
                      Container(
                        margin: EdgeInsets.only(top: height),
                        child: Text("unilib",
                            style: GoogleFonts.quicksand(
                                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2)),
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
