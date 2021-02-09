import 'package:flutter/material.dart';
import 'package:kotykids/view/widgets/Txt.dart';

class TxtForm extends StatelessWidget {
  final String title;
  final String hint;
  final Widget icon;
  final Function onSaved;
  final Function validator;
  const TxtForm({
    Key key,
    this.title = "add field name",
    this.hint,
    this.icon,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Txt(
          title: title,
          color: Colors.grey.shade700,
          size: 14,
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: icon,
              fillColor: Colors.green.withOpacity(.1),
              filled: true),
        )
      ],
    );
  }
}
