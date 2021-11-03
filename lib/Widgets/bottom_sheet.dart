import 'package:flutter/material.dart';

class CustomBottomSheet {
  final Widget child;

  CustomBottomSheet({required this.child});
  show({required BuildContext context}) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Material(
            child: Container(
              child: Container(
                child: child,
              ),
            ),
          );
        });
  }
}
