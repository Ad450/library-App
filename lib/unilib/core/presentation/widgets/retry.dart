import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/Data/platforms/assets/app_Images.dart';
import 'package:library_project/unilib/core/presentation/widgets/customButton.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/signUpScreen.dart';

class Retry extends StatelessWidget {
  final String? message;
  Retry({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 6;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  message ?? "Something went wrong",
                  style:
                      GoogleFonts.quicksand(color: Colors.black, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Please try again",
                  style:
                      GoogleFonts.quicksand(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(AppAssets.retry),
              SizedBox(
                height: 0,
              ),
              CustomButton(
                title: "Retry",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                padding: 9,
                textColor: Colors.black,
                color: Colors.amberAccent,
              ),
              Container(
                alignment: Alignment.center,
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
    );
  }
}
