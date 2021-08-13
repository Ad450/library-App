import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';


class SignUpWidget extends StatelessWidget {
  const SignUpWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade900,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Please Register with email and sign up to continue using our app",
            style: TextStyle(
                color: Colors.black87, fontWeight: FontWeight.w400, height: 1),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Enter via Social Networks",
            style: TextStyle(
              color: Colors.indigo.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              borderOnForeground: true,
              elevation: 10,
              shape: CircleBorder(),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape:
                      MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
                ),
                child: Image.asset(
                  Constants.googleImage,
                  height: 30,
                  width: 20,
                ),
                // TODO: this handler will authenticate user using google auth
                onPressed: () {},
              ),
            ),
            Card(
              borderOnForeground: true,
              elevation: 20,
              shape: CircleBorder(),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    CircleBorder(),
                  ),
                ),
                child: Icon(Icons.facebook, color: Colors.indigo.shade900),
                // TODO: this handler will authenticate user using facebook auth
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "or login with",
            style: TextStyle(
                color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "email",
            style: TextStyle(
              color: Colors.indigo.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
