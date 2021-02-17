import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String title;
  final Color color;
  final double size;
  final Alignment align;
  final bool bold;
  const Txt({
    this.align = Alignment.topLeft,
    this.title = "Add Title Here",
    this.color = Colors.black,
    this.size = 16,
    this.bold = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Text(
        title,
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
