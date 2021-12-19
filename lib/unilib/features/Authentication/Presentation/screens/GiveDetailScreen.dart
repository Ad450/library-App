import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiveDetailsScreen extends StatefulWidget {
  const GiveDetailsScreen({Key? key}) : super(key: key);

  static final detailsUrl = "/booksPage";

  @override
  _GiveDetailsScreenState createState() => _GiveDetailsScreenState();
}

class _GiveDetailsScreenState extends State<GiveDetailsScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container()),
    );
  }
}
