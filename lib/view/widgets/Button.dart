import 'package:flutter/material.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/view/widgets/Txt.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color titleColor;
  final String title;
  final Function onPressed;
  const Button({
    Key key, this.color=primaryColor, this.titleColor=Colors.white, this.title, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(16),
      onPressed: onPressed,
      child: Txt(
        title: title,
        color: Colors.white,
        align: Alignment.center,
      ),
      color:color ,
    );
  }
}
