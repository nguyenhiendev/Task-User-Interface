import 'package:dghome3d/app/routes/app_pages.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;
  UserCredential? userCredential;
  GoogleSignInAccount? currentUserGG;
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoggedIn = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Login FB
  Future<void> loginWithFB() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await auth
          .signInWithCredential(credential)
          .then((value) => userCredential = value);
      isLoggedIn = true;
      update();
      print(userCredential);
    }
  }

  //Logout FB
  Future logoutWithFB() async {
    await FacebookAuth.instance.logOut();
    isLoggedIn = false;
    update();
    Get.offAllNamed(Routes.HOME);
  }

  // Login GG
  Future<void> loginWithGG() async {
    final currentUserGG = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await currentUserGG?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await auth
        .signInWithCredential(credential)
        .then((value) => userCredential = value);
    isLoggedIn = true;
    update();
    print(userCredential);
  }

  //Logout GG
  Future<void> logoutWithGG() async {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    isLoggedIn = false;
    update();
    Get.offAllNamed(Routes.HOME);
  }

  // Register
  Future<void> register(
    String? email,
    String? name,
    String? password,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: email!.trim(),
            password: password!,
          )
          .then((value) => userCredential = value);

      if (userCredential != null) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.defaultDialog(title: "Error", middleText: "Please, register again");
        Get.toNamed(Routes.REGISTER);
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        "$e'",
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }

  //Login
  Future<void> login(String? email, String? password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email!.trim(), password: password!)
          .then((value) => userCredential = value);
      print(userCredential);
      isLoggedIn = true;
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //Forgot password
  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  //signOut
  Future<void> signOut() async {
    await auth.signOut();
  }
}
