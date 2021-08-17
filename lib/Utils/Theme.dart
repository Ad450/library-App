import 'package:flutter/material.dart';

class Themes {
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo.shade900,
    );
  }

  ThemeData darkTheme() {
    return _darkTheme();
  }
}
