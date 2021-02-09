import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/services/firestore_user.dart';
import 'package:kotykids/model/user_model.dart';
import 'package:kotykids/view/home_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name;
  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = await GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    await _auth.signInWithCredential(credential).then((user) async {
      await FireStoreUser().addUsertoFireStore(UserModel(
          userid: user.user.uid,
          email: user.user.email,
          name: name == null ? user.user.displayName : name,
          pic: ""));
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.message);
      Get.snackbar("Error in Signing in", e.message,
          maxWidth: Get.width / 1.2,
          snackPosition: SnackPosition.BOTTOM,
          padding: EdgeInsets.only(bottom: 20),
          borderColor: primaryColor,
          icon: Icon(Icons.error),
          barBlur: 40,
          overlayBlur: 5);
    }
  }

  void CreateAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUsertoFireStore(UserModel(
            userid: user.user.uid,
            email: user.user.email,
            name: name,
            pic: ""));
      });
      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar("Error in Signing up", e.message,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: Get.width / 1.2,
          icon: Icon(Icons.error),
          padding: EdgeInsets.only(bottom: 20),
          borderColor: primaryColor,
          barBlur: 40,
          overlayBlur: 5);
    }
  }
}
