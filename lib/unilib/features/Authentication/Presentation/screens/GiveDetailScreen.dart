import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/utils/validator_helpers.dart';

class GiveDetailsScreen extends StatefulWidget {
  const GiveDetailsScreen({Key? key}) : super(key: key);

  static final detailsUrl = "/booksPage";

  @override
  _GiveDetailsScreenState createState() => _GiveDetailsScreenState();
}

class _GiveDetailsScreenState extends State<GiveDetailsScreen> with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _institutionController = TextEditingController();

  final _nameFocus = FocusNode();
  final _institutionFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.amberAccent,
                      focusNode: _nameFocus,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "please enter your name";
                        }
                        return Validator.validateEmail(email) ? null : "invalid email";
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.quicksand(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)),
                        hintText: 'Manuel Atinga',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.amberAccent),
                      ),
                      onEditingComplete: _institutionFocus.requestFocus),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amberAccent,
                    focusNode: _institutionFocus,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "please enter your institution (Name of School)";
                      }
                      return null;
                    },
                    controller: _institutionController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.quicksand(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)),
                      hintText: 'University of Energy and Natural Resources',
                      hintStyle: TextStyle(fontSize: 15, color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
