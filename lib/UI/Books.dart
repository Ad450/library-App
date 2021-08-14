import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  static final booksPageUrl = "/booksPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("hurray!! welcome to books screen"),),
    );
  }
}
