import 'package:flutter/material.dart';
import 'package:library_project/constants/constants.dart';

class GoogleFBWidget extends StatelessWidget {
  final String? authMessage;
  final String? authTextMessage;
  final Function? authGoogleFunction;
  final Function? authFBFunction;

  const GoogleFBWidget(
      {Key? key,
        @required this.authMessage,
        @required this.authTextMessage,
        @required this.authGoogleFunction,
        @required this.authFBFunction
      })
      : super(key: key);

  void _authGoogleFunction() {
    authGoogleFunction!();
  }
  void _authFBFunction(){
    authFBFunction!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          authMessage!,
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
            authTextMessage!,
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
                
                onPressed: _authGoogleFunction,
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
              
                onPressed:_authFBFunction
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
    ));
  }
}
