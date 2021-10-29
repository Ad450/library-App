import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? _title;
  final Color? _containerColor;
  final Color? _textColor;
  final double? _padding;
  final double? _height;
  final Function? _onTap;
  const CustomButton({
    Key? key,
    @required String? title,
    @required Color? color,
    @required Color? textColor,
    @required double? padding,
    @required Function? onTap,
    double? height,
  })  : _textColor = textColor,
        _onTap = onTap,
        _title = title,
        _padding = padding,
        _height = height,
        _containerColor = color,
        super(key: key);

  void onTap() {
    _onTap!();
  }

  @override
  Widget build(BuildContext context) {
    // final paddingWidth = _mediaQuery.size.longestSide / 6;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: _height ?? 0),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(_padding!, 20, _padding!, 20),
        child: Text(
          _title!,
          style: GoogleFonts.quicksand(
              fontSize: 20, color: _textColor, letterSpacing: 2),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: _containerColor),
      ),
    );
  }
}
