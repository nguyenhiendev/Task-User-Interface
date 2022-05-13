// ignore_for_file: camel_case_types

import 'package:dghome3d/app/modules/home/views/home_view.dart';
import 'package:dghome3d/app/modules/profile/views/profile_view.dart';
import 'package:dghome3d/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../controllers/auth_controller.dart';

import 'components/f_password.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(HomeView(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          icon: Icon(Icons.arrow_back, color: HexColor("1C1C1C"), size: 35),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          key: _formKey,
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "Login",
                  textScaleFactor: 1,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#575DFB"),
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                child: Text(
                  "Login now to track all your expenses and income at a place!",
                  textScaleFactor: 1,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#1C1C1C"),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              //TextForm email
              Text(
                "Email",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: HexColor("#575DFB"),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: HexColor("#575DFB"),
                    ),
                    contentPadding: const EdgeInsets.only(top: 15),
                    border: InputBorder.none,
                    hintText: 'Ex: abc@example.com',
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              // TextForm Password
              Text(
                "Your Password",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: HexColor("#575DFB"),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: HexColor("#575DFB"),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 18),
                    hintText: '**********',
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              // Forgot Password
              const _forgotPassword(),
              const SizedBox(height: 28),
              //Button Login
              SizedBox(
                width: Get.width,
                height: 56,
                child: ElevatedButton(
                  onPressed: () async {
                    await controllerA.login(email.text, password.text);
                    Get.to(Profile(),
                        duration: const Duration(seconds: 1),
                        transition: Transition.fadeIn);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Login",
                          textScaleFactor: 1,
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: HexColor("#FFFFFF")),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#575DFB"),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Don’t have an account?",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
              //Register
              const _register(),
              // Other Login Method
              const _otherLoginMethod()
            ],
          ),
        ),
      ),
    );
  }
}

class _otherLoginMethod extends StatelessWidget {
  const _otherLoginMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: -30,
              bottom: 30,
            ),
          ),
          onPressed: () {
            Get.to(HomeView(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          child: Text(
            "Try other login method",
            textScaleFactor: 1,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: HexColor("#575DFB"),
            ),
          ),
        ),
      ],
    );
  }
}

class _register extends StatelessWidget {
  const _register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.only(right: 30),
          ),
          onPressed: () {
            Get.to(RegisterView(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          child: Text(
            "Register",
            textScaleFactor: 1,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: HexColor("#575DFB"),
            ),
          ),
        ),
      ],
    );
  }
}

class _forgotPassword extends StatelessWidget {
  const _forgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Get.to(FPassword(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          child: Text(
            "Forgot Password?",
            textScaleFactor: 1,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: HexColor("#575DFB"),
            ),
          ),
        ),
      ],
    );
  }
}
