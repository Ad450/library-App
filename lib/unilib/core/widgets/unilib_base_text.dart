import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnilibBaseText extends StatelessWidget {
  final String _splashTitle = "UNILIB";
  const UnilibBaseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      _splashTitle,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
        fontSize: 24,
        color: Colors.teal,
      ),
    ));
  }
}
