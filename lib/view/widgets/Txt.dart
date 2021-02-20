import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String title;
  final Color color;
  final double size;
  final Alignment align;
  final bool bold;
  final double height;
  const Txt({
    this.align = Alignment.topLeft,
    this.title = "Add Title Here",
    this.color = Colors.black,
    this.size = 16,
    this.bold = false,
    Key key,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Text(
        title,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          height: height,
          fontFamily: "font",
          color: color,
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
