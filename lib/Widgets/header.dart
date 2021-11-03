import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final Icon leadingIcon;
  final Icon? trailingIcon;
  final String headerText;
  final String trailingText;
  final Widget child;
  final Widget? trailingWidget;
  final Function trailingTextTapped;
  const Header(
      {Key? key,
      required this.leadingIcon,
      this.trailingIcon,
      required this.headerText,
      required this.child,
      this.trailingWidget,
      required this.trailingText,
      required this.trailingTextTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: trailingIcon ?? Container(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          child: Container(
                        child: trailingWidget,
                      ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headerText,
                      style: GoogleFonts.quicksand(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        trailingTextTapped();
                      },
                      child: Text(
                        trailingText,
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: child,
          )
        ],
      )),
    );
  }
}
