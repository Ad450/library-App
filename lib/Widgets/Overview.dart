import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/constants/constants.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    var _space = MediaQuery.of(context).size.height / 7;
    return Scaffold(
      backgroundColor: Colors.white,
      body: !Provider.of<StateProvider>(context).userFormPostSuccessful!
          ? _OverviewImage()
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Hi,",
                        style: GoogleFonts.quicksand(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: _space,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Colors.grey,
                        // TODO: user pic here if any else show perons Icon
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //TODO: append to all fields neccessary values
                    Text(
                      "username:",
                      style: GoogleFonts.quicksand(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Program of Study:",
                      style: GoogleFonts.quicksand(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name of School:",
                      style: GoogleFonts.quicksand(fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: _space),
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

class _OverviewImage extends StatelessWidget {
  const _OverviewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          Image.asset(Constants.modalImage),
          Text(
            "No overview here, please fill out the profile form first",
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
