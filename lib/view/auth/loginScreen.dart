import 'package:flutter/material.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/view/widgets/Txt.dart';

// ignore: camel_case_types
class loginScreen extends StatelessWidget {
  const loginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  title: "welcome",
                  color: Colors.black,
                  size: 30,
                ),
                Txt(
                  title: "SignUp",
                  color: primaryColor,
                  size: 18,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
