import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/* import 'package:flutter_facebook_login/flutter_facebook_login.dart'; */
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name;
  @override
  void onInit() {
    super.onInit();
  }

  googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    _auth.signInWithCredential(credential);
  }

  facebookSignInMethod() async {
    GetBar(
      message: "Will be available in next update ",
      barBlur: 10,
      icon: Icon(Icons.download_done_outlined),
    );
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.message);
      Get.snackbar("Error in Signing in", e.message,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(Icons.error),
          barBlur: 40,
          overlayBlur: 5);
    }
  }
}
