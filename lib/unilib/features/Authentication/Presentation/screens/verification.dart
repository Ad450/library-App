import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/Data/platforms/assets/app_Images.dart';
import 'package:library_project/unilib/core/presentation/widgets/customButton.dart';
import 'package:library_project/unilib/core/presentation/widgets/retry.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/EnterOTPScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verfication_state.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_event.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 6;
    return Consumer<VerificationBloc>(
        builder: (_, verificationBloc, __) => StreamBuilder<VerificationState>(
            stream: verificationBloc.verificationStateStream,
            initialData: VerificationInitial(
                formkey: _key,
                emailController: _emailController,
                height: height),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError)
                  return Center(
                    child: Text(" verification error occured"),
                  );

                if (!snapshot.hasData)
                  return Center(
                    child: Text("verification no data error occured"),
                  );

                if (snapshot.data is VerificationLoading)
                  return LoadingScreen();

                if (snapshot.data is VerificationLoaded)
                  return EnterOTPScreen();

                if (snapshot.data is VerificationError)
                  return Retry(
                    message: "snapshot.data.error",
                  );
              }

              return VerificationInitial(
                  formkey: _key,
                  emailController: _emailController,
                  height: height);
            }));
  }
}

class VerificationInitial extends StatelessWidget implements VerificationState {
  GlobalKey<FormState> formkey;
  TextEditingController emailController;

  double height;

  VerificationInitial({
    Key? key,
    required this.formkey,
    required this.emailController,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please verify your email",
                        style: GoogleFonts.quicksand(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(AppAssets.verify),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.amberAccent,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "please enter your email";
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.quicksand(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent)),
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.amberAccent),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      title: "send code ",
                      color: Colors.amberAccent,
                      textColor: Colors.black,
                      padding: 7,
                      onTap: () {
                        if (formkey.currentState!.validate())
                          Provider.of<VerificationBloc>(context, listen: false)
                              .verificationEventSink
                              .add(
                                VerificationEvent.withEmail(
                                    email: emailController.value.text),
                              );
                      },
                    ),
                    SizedBox(
                      height: 20,
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
            ),
          ),
        ),
      ),
    );
  }
}
