import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  static final verificationScreenRoute = "/verificationUrl";

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: 
              SingleChildScrollView(
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ), 
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
                            height: 30,
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
