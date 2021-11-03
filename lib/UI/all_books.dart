import 'package:flutter/material.dart';
import 'package:library_project/Widgets/bottom_sheet.dart';

class AllbookScreen extends StatelessWidget {
  const AllbookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        width: double.infinity,
        child: CustomBottomSheet(child: Container()).show(context: context),
      ),
    );
  }
}
