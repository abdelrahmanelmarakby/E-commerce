import 'package:flutter/material.dart';

import 'Txt.dart';

class SocialMediaButton extends StatelessWidget {
  final String imageSrc;
  final String text;
  final Function onPressed;
  const SocialMediaButton({
    Key key,
    this.imageSrc,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.green[300],
      height: MediaQuery.of(context).size.height / 14,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.green.withOpacity(.1),
      onPressed: () => onPressed,
      child: Row(
        children: [
          Image.asset(imageSrc,
              width: MediaQuery.of(context).size.width / 14,
              fit: BoxFit.fitWidth),
          SizedBox(
            width: 10,
          ),
          Txt(
            title: text,
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}
