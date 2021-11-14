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
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpBloc>(
        builder: (_, signUpBloc, __) => StreamBuilder<SignUpState>(
            stream: signUpBloc.signUpStateStream,
            initialData: SignUpInitial(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                print("entered connectivity");
                print(snapshot.data);
                if (snapshot.hasError)
                  return Center(
                    child: Text("sign up error occured"),
                  );
                if (!snapshot.hasData)
                  return Center(
                    child: Text("no data sign up error occured"),
                  );

                if (snapshot.data is SignUpLoadingState)
                  return Center(child: LoadingScreen());

                if (snapshot.data is SignUpErrorState)
                  return Retry(message: "error occured");

                if (snapshot.data is SignUpLoadedState) {
                  return VerificationScreen();
                }
              }

              return SignUpInitial();
            }));
  }
}

class SignUpInitial extends StatelessWidget implements SignUpState {
  @override
  var data;

  @override
  String? errorMessage;
  SignUpInitial({
    this.data,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForms(
      buttonTitle: "Register",
      title: "Sign Up",
      paddingDecider: double.infinity,
      onTap: ({required String email, required String password}) {
        Provider.of<SignUpBloc>(context, listen: false)
            .signUpEventSink
            .add(SignUpEvents.containUserInfo(email: email, name: password));
      },
    );
  }
}

// when ontapped, navigate to a new. Wrap the new screen with future builder, show appropriate widget based on the future

// class WaitingScreen extends StatefulWidget {
//   WaitingScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _WaitingScreenState createState() => _WaitingScreenState();
// }

// class _WaitingScreenState extends State<WaitingScreen> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Consumer<SignUpBloc>(
//       builder: (_, _signUpBloc, __) => StreamBuilder<SignUpState>(
//         stream: _signUpBloc.signUpStateStream,
//         builder: (BuildContext context, AsyncSnapshot<SignUpState> snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasError)
//               return Center(
//                 child: Text("sign up error occured"),
//               );
//             if (!snapshot.hasData)
//               return Center(
//                 child: Text("no data sign up error occured"),
//               );

//             if (snapshot.data is SignUpLoadingState)
//               return Center(child: LoadingScreen());

//             if (snapshot.data is SignUpErrorState)
//               return Retry(message: snapshot.data!.errorMessage);

//             if (snapshot.data is SignUpLoadingState) {
//               return VerificationScreen();
//             }
//           }else{
//              return Text("sorry");
//           }

//          return Text("no connection");
//         },
//       ),
//     ));
//   }
// }
