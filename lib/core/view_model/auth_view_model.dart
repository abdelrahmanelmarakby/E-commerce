import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
  }

  googleSignInMethod() async {
  final GoogleSignInAccount googleuser=  await _googleSignIn.signIn();
  }
}
