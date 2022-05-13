import 'package:dghome3d/app/controllers/auth_controller.dart';
import 'package:dghome3d/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../login/views/login_view.dart';
import '../../phone/views/phone_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(35, 200, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 152,
                  height: 39,
                  child: Text(
                    "Welcome to",
                    textScaleFactor: 1,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1C1C1C"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 262,
                  height: 52,
                  child: Text(
                    "dghome3d",
                    textScaleFactor: 1,
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#575DFB"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 289,
                  height: 38,
                  child: AutoSizeText(
                    "A place where you can explore our interior concepts and try in reality",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1C1C1C"),
                    ),
                    presetFontSizes: const [16, 12],
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 68),
                SizedBox(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Button login with phone
                          const LoginWithPhone(),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button login with Facebook
                          LoginWithFacebook(),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button login with Google
                          LoginWithGoogle(),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button login with Email and Password
                          const LoginWithEmail(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Already have an account?",
                                textScaleFactor: 1,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor("#1C1C1C"),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(Login(),
                                      duration: const Duration(seconds: 1),
                                      transition: Transition.fadeIn);
                                },
                                child: Text(
                                  "Login",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor("#575DFB"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWithPhone extends StatelessWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Get.to(PhoneView(),
              duration: const Duration(seconds: 1),
              transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: HexColor("#575DFB"),
              radius: 13,
              child: Image.asset(
                "assets/logo/rect6580.png",
                width: Get.width,
                height: Get.height,
              ),
            ),
            const SizedBox(
              width: 8.25,
            ),
            SizedBox(
              height: 24,
              width: 215,
              child: Text(
                "Continue with Phone",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#1C1C1C"),
                ),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: HexColor("#FFFFFF"),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(width: 1.5, color: HexColor("#1C1C1C"))),
        ),
      ),
    );
  }
}

class LoginWithFacebook extends StatelessWidget {
  LoginWithFacebook({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          await controllerA.loginWithFB();
          Get.to(
            Profile(),
            duration: const Duration(seconds: 1),
            transition: Transition.fadeIn,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      HexColor("#19AFFF"),
                      HexColor("#0062E0"),
                    ],
                    stops: const [
                      0,
                      0.7,
                    ]),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 13,
                child: Image.asset(
                  "assets/logo/LogoFB.png",
                  width: Get.width,
                  height: Get.height,
                ),
              ),
            ),
            const SizedBox(
              width: 8.25,
            ),
            SizedBox(
              height: 24,
              width: 215,
              child: Text(
                "Continue with Facebook",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#1C1C1C"),
                ),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: HexColor("#FFFFFF"),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(width: 1.5, color: HexColor("#1C1C1C"))),
        ),
      ),
    );
  }
}

class LoginWithGoogle extends StatelessWidget {
  LoginWithGoogle({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          await controllerA.loginWithGG();
          Get.to(Profile(),
              duration: const Duration(seconds: 1),
              transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 13,
              child: Image.asset(
                "assets/logo/Logo.png",
                width: Get.width,
                height: Get.height,
              ),
            ),
            const SizedBox(
              width: 8.25,
            ),
            SizedBox(
              height: 24,
              width: 215,
              child: Text(
                "Continue with Google",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#1C1C1C")),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: HexColor("#FFFFFF"),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(width: 1.5, color: HexColor("#1C1C1C"))),
        ),
      ),
    );
  }
}

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Get.to(Login(),
              duration: const Duration(seconds: 1),
              transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 13,
              child: Image.asset(
                "assets/logo/Vector.png",
                width: Get.width,
                height: Get.height,
              ),
            ),
            const SizedBox(
              width: 8.25,
            ),
            SizedBox(
              height: 24,
              width: 215,
              child: Text(
                "Continue with Email",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#1C1C1C")),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: HexColor("#FFFFFF"),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              width: 1.5,
              color: HexColor("#1C1C1C"),
            ),
          ),
        ),
      ),
    );
  }
}
