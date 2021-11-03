import 'package:flutter/material.dart';
import 'package:library_project/UI/LoadingScreen.dart';
import 'package:library_project/Widgets/header.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2), () => 45),
          builder: (context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError)
              return Scaffold(
                body: Center(
                  child: Text("error occured, please try again"),
                ),
              );

            if (!snapshot.hasData) return LoadingScreen();

            return _BookContent();
          }),
    );
  }
}

class _BookContent extends StatelessWidget {
  const _BookContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Header(
              headerText: "Books",
              leadingIcon: Icon(Icons.menu),
              child: Container(),
            )),
      ),
    );
  }
}
