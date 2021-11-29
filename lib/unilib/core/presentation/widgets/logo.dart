import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/Data/platforms/assets/app_Images.dart';

class CustomLogo extends StatelessWidget {
  final Color? _containerColor;
  const CustomLogo({Key? key, Color? containerColor})
      : _containerColor = containerColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: _containerColor),
      child: Image.asset(
        AppAssets.logo,
        height: 60,
        width: 60,
      ),
    );
  }
}
