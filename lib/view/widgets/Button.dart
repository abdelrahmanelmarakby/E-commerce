import 'package:flutter/material.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/view/widgets/Txt.dart';

class Button extends StatelessWidget {
  final String title;

  final Color color;

  final Function onPressed;

  final Color titleColor;
  const Button({
    Key key,
    this.titleColor = Colors.white,
    @required this.onPressed,
    this.title = 'Write text ',
    this.color = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPressed,
      color: primaryColor,
      child: Txt(
        align: Alignment.center,
        title: title,
        color: titleColor,
      ),
    );
  }
}
