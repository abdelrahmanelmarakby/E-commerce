import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/Util/binding.dart';
import 'package:kotykids/view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'KotyKids',
      defaultTransition: Transition.rightToLeftWithFade,
      home: ControlView(),
      theme: ThemeData(primaryColor: primaryColor, accentColor: primaryColor),
    );
  }
}
