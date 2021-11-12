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

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  //static final verificationScreenRoute = "/verificationUrl";

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  late VerificationBloc _verificationBloc;
  @override
  void initState() {
    _verificationBloc = VerificationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 6;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Form(
                key: _key,
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
                      controller: _emailController,
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
                        if (_key.currentState!.validate())
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                _verificationBloc.verificationEventSink.add(
                                  VerificationEvent.withEmail(
                                      email: _emailController.value.text),
                                );
                                return WaitingVerification(
                                  verificationBloc: _verificationBloc,
                                );
                              },
                            ),
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

class WaitingVerification extends StatelessWidget {
  final VerificationBloc _verificationBloc;
  const WaitingVerification(
      {Key? key, required VerificationBloc verificationBloc})
      : _verificationBloc = verificationBloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<VerificationState>(
        stream: _verificationBloc.verificationStateStream,
        builder: (context, AsyncSnapshot<VerificationState> snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(" verification error occured"),
            );

          if (!snapshot.hasData)
            return Center(
              child: Text("verification no data error occured"),
            );

          if (snapshot.data == VerificationState.LOADING)
            return LoadingScreen();

          if (snapshot.data == VerificationState.LOADED)
            return EnterOTPScreen();

          if (snapshot.data == VerificationState.ERROR) return Retry(message: null,);

          return Text("couldnot verify");
        },
      ),
    );
  }
}
