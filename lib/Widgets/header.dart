import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final Icon leadingIcon;
  final Icon? trailingIcon;
  final String headerText;
  final Widget child;
  const Header(
      {Key? key,
      required this.leadingIcon,
      this.trailingIcon,
      required this.headerText,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: leadingIcon,
                ),
                IconButton(
                  onPressed: () {},
                  icon: trailingIcon ?? Container(),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                headerText,
                style: GoogleFonts.quicksand(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          child: child,
        )
      ],
    ));
  }
}
