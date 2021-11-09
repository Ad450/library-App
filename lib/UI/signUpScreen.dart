import 'package:flutter/material.dart';
import 'package:library_project/UI/LoadingScreen.dart';
import 'package:library_project/UI/verification.dart';
import 'package:library_project/Widgets/CustomForms.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_event.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc _signUpBloc;

  @override
  void initState() {
    _signUpBloc = SignUpBloc();
    super.initState();
  }

  @override
  void dispose() {
    _signUpBloc.close();
    super.dispose();
  }

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
            builder: (context) {
              _signUpBloc.signUpEventSink.add(SignUpEvents());
              return WaitingScreen(signUpBloc: _signUpBloc);
            },
          ),
        );
      },
    );
  }
}

// when ontapped, navigate to a new. Wrap the new screen with future builder, show appropriate widget based on the future

class WaitingScreen extends StatelessWidget {
  SignUpBloc _signUpBloc;
  WaitingScreen({Key? key, required SignUpBloc signUpBloc})
      : _signUpBloc = signUpBloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<SignUpState>(
      stream: _signUpBloc.signUpStateStream,
      builder: (BuildContext context, AsyncSnapshot<SignUpState> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text("error occured"),
          );

        if (!snapshot.hasData)
          return Center(
            child: Text("error occured"),
          );

        if (snapshot.data == SignUpState.LOADING) return VerificationScreen();

        return Text("sorry");
      },
    ));
  }
}
