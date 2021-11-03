import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/widgets/unilib_base_text.dart';

class UnilibPageWrapper extends StatelessWidget {
  final Widget child;
  const UnilibPageWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: child,
                ),
              ),
              Center(
                child: Container(
                  child: UnilibBaseText(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
