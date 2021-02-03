import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String title;
  final Color color;
  final double size;
  const Txt({
    this.title,
    this.color,
    this.size,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     title,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
