import 'package:flutter/material.dart';

class UnilibButton extends StatelessWidget {
  final Color color;
  final Text text;
  const UnilibButton({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          child: Center(child: text),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
