import 'package:dghome3d/app/modules/home/views/home_view.dart';
import 'package:dghome3d/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controllers/auth_controller.dart';

import '../../../utils/validator.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  "Register",
                  textScaleFactor: 1,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#575DFB"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: RichText(
                  textScaleFactor: 1,
                  text: TextSpan(
                    text: 'Create an account to get better support from',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1C1C1C"),
                    ),
                    children: [
                      TextSpan(
                        text: 'dghome3d',
                        style: GoogleFonts.inter(
                          color: HexColor("#575DFB"),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //Email
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
                  controller: emailController,
                  validator: (value) => Validator.validateEmail(email: value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: HexColor("#575DFB"),
                    ),
                    border: InputBorder.none,
                    hintText: 'Ex: abc@example.com',
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
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
              //Your Name
              Text(
                "Your Name",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
              const SizedBox(height: 6),
              Container(
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
                  controller: nameController,
                  validator: (value) => Validator.validateName(
                    name: value,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: HexColor("#575DFB"),
                    ),
                    border: InputBorder.none,
                    hintText: 'Ex. Meo meo',
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
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
              //Your Password
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
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: HexColor("#575DFB"),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      top: 15,
                      bottom: -15,
                    ),
                    hintText: '**********',
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 58),
              // Button Register
              SizedBox(
                width: Get.width,
                height: 56,
                child: ElevatedButton(
                  onPressed: () async {
                    await controllerA.register(emailController.text,
                        nameController.text, passwordController.text);
                    Get.to(Login(),
                        duration: const Duration(seconds: 1),
                        transition: Transition.fadeIn);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Register",
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
