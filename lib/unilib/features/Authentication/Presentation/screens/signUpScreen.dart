import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/presentation/widgets/CustomForms.dart';
import 'package:library_project/unilib/core/presentation/widgets/retry.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/verification.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_event.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_state.dart';
import 'package:provider/provider.dart';

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
      onTap: ({required String email, required String password}) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              _signUpBloc.signUpEventSink.add(
                  SignUpEvents.containUserInfo(email: email, name: password));
              return WaitingScreen(signUpBloc: _signUpBloc);
            },
          ),
        );
      },
    );
  }
}

// when ontapped, navigate to a new. Wrap the new screen with future builder, show appropriate widget based on the future

class WaitingScreen extends StatefulWidget {
  final SignUpBloc _signUpBloc;
  WaitingScreen({Key? key, required SignUpBloc signUpBloc})
      : _signUpBloc = signUpBloc,
        super(key: key);

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void dispose() {
    widget._signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<SignUpState>(
      stream: widget._signUpBloc.signUpStateStream,
      builder: (BuildContext context, AsyncSnapshot<SignUpState> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) if (snapshot
            .hasError)
          return Center(
            child: Text("sign up error occured"),
          );

        if (!snapshot.hasData)
          return Center(
            child: Text("no data sign up error occured"),
          );

        if (snapshot.data == SignUpState.LOADING)
          return Center(child: LoadingScreen());

        if (snapshot.data == SignUpState.ERROR) return Retry();

        if (snapshot.data == SignUpState.LOADED) {
          return VerificationScreen();
        }

        return Text("sorry");
      },
    ));
  }
}
