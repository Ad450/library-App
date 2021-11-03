import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/platform/app_Images.dart';
import 'package:library_project/unilib/core/widgets/unilib_button.dart';
import 'package:library_project/unilib/core/widgets/unilib_page_wrapper.dart';

class UnilibGettingStartedScreen extends StatelessWidget {
  const UnilibGettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: UnilibPageWrapper(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Image.asset(AppAssets.image1),
                ),
                UnilibButton(
                  color: Colors.blue,
                  text: Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
