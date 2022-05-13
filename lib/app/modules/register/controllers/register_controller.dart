import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? userCredential;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
