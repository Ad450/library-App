import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/widgets/widgets/CustomForms.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForms(
      buttonTitle: "Register",
      title: "Sign Up",
      paddingDecider: double.infinity,
      onTap: ({required String email, required String password}) {},
    );
  }
}
