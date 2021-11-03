import 'package:flutter/material.dart';
import 'package:library_project/UI/LoadingScreen.dart';
import 'package:library_project/UI/verification.dart';
import 'package:library_project/Widgets/CustomForms.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomForms(
      buttonTitle: "Register",
      title: "Sign Up",
      paddingDecider: double.infinity,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaitingScreen(),
          ),
        );
      },
    );
  }
}

// when ontapped, navigate to a new. Wrap the new screen with future builder, show appropriate widget based on the future

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: Future.delayed(Duration(seconds: 2), () => 45),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text("error occured"),
          );

        if (!snapshot.hasData) return LoadingScreen();

        return VerificationScreen();
      },
    ));
  }
}
