import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/core/view_model/auth_view_model.dart';
import 'package:kotykids/view/widgets/Button.dart';
import 'package:kotykids/view/widgets/TextForm.dart';
import 'package:kotykids/view/widgets/Txt.dart';

import '../../consts.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              Txt(
                title: "SignUp",
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Txt(
                title: "Sign up to create new account",
                size: 14,
                color: Colors.grey,
                align: Alignment.topLeft,
              ),
              SizedBox(
                height: 40,
              ),
              TxtForm(
                title: "Name",
                hint: "yourname",
                icon: Icon(
                  Icons.person_outline,
                  color: primaryColor,
                ),
                onSaved: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
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
              Button(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    controller.CreateAccountWithEmailAndPassword();
                  }
                },
                title: "SIGN UP",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
