import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/view_model/auth_view_model.dart';
import 'package:kotykids/view/auth/register_view.dart';
import 'package:kotykids/view/widgets/Button.dart';
import 'package:kotykids/view/widgets/SocialMediaButton.dart';
import 'package:kotykids/view/widgets/TextForm.dart';
import 'package:kotykids/view/widgets/Txt.dart';

// ignore: camel_case_types
class loginScreen extends GetWidget<AuthViewModel> {
  loginScreen({Key key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            addAutomaticKeepAlives: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    title: "Welcome,",
                    color: Colors.black,
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(RegisterView()),
                    child: Txt(
                      title: "SignUp",
                      color: primaryColor,
                      size: 18,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Txt(
                title: "Sign in to continue",
                size: 14,
                color: Colors.grey,
                align: Alignment.topLeft,
              ),
              SizedBox(
                height: 40,
              ),
              TxtForm(
                title: "Email",
                hint: "example@mail.com",
                icon: Icon(
                  Icons.alternate_email,
                  color: primaryColor,
                ),
                onSaved: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TxtForm(
                title: "Password",
                hint: "********",
                icon: Icon(
                  Icons.lock_outlined,
                  color: primaryColor,
                ),
                onSaved: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Txt(
                title: "Forget password ?",
                size: 14,
                align: Alignment.topRight,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    controller.signInWithEmailAndPassword();
                  }
                },
                title: "SIGN IN",
              ),
              SizedBox(height: 10),
              Txt(
                title: "- OR -",
                align: Alignment.center,
                color: Colors.grey,
              ),
              SocialMediaButton(
                imageSrc: "assets/Glogo.png",
                text: "Sign in with Google",
                onPressed: controller.googleSignInMethod,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
