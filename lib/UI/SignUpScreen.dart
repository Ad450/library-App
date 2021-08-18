import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/verification.dart';
import 'package:library_project/Widgets/CustomForms.dart';

import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget _loadingIndicator() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amberAccent,
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, String? message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message ?? "nothing here"),
          content: Text("please try again or login"),
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

  void _closeDialog() {
    Navigator.pop(context);
  }

  void _handleSignUp(
      StateProvider _provider,
      String? _email,
      String? _password,
      TextEditingController _emailController,
      TextEditingController _passwordController) async {
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

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);

    return _provider.isAuthLoading
        ? _loadingIndicator()
        : CustomForms(
            buttonTitle: "Register",
            title: "Sign Up",
            paddingDecider: 7,
            authHandler: _handleSignUp);
  }
}
