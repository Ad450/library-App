import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Color color;
  final Widget child;
  const BookCard({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey)]),
      child: child,
    );
  }
}
