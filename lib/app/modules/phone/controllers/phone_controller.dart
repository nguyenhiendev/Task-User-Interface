import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/users_model.dart';
import '../../../routes/app_pages.dart';

class PhoneController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  bool isLoggedIn = false;
  String? verificationId;
  String otp = "";
  TextEditingController otpCode = TextEditingController();
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var user = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  void showMessage(String errorMessage) {
    Get.defaultDialog(
      content: AlertDialog(
        title: const Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () async {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Future<void> phoneSignIn(String phone) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 120),
          verificationCompleted: _onVerificationCompleted,
          verificationFailed: _onVerificationFailed,
          codeSent: _onCodeSent,
          codeAutoRetrievalTimeout: _onCodeTimeout);
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      Get.snackbar("", "Failed to Verify Phone Number: ${e}");
    }
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    otpCode.text = authCredential.smsCode!;
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
    Get.toNamed(Routes.PHONE);
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;

    print(forceResendingToken);

    print("code sent");
  }

  void _onCodeTimeout(String timeout) {
    verificationId = timeout;
  }

  Future<void> getOtp(String otp) async {
    await _auth
        .signInWithCredential(
          PhoneAuthProvider.credential(
            verificationId: verificationId!,
            smsCode: otp,
          ),
        )
        .then((value) => userCredential = value);
    print(userCredential);
    isLoggedIn = true;
    update();
  }
}
