import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UserCredential? userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  final isLoggedIn = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
