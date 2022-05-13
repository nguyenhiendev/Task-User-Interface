import 'package:dghome3d/app/controllers/auth_controller.dart';
import 'package:dghome3d/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FPassword extends StatelessWidget {
  FPassword({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(Login(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          icon: Icon(Icons.arrow_back, color: HexColor("1C1C1C"), size: 35),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                "Forgot Password?",
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
            Flexible(
              child: Text(
                "Recover you password if you have \nforgot the password!",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
            ),
            const SizedBox(height: 55),
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
                  border: InputBorder.none,
                  hintText: 'Ex: abc@example.com',
                  contentPadding: const EdgeInsets.only(top: 15),
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
            //Button Submit
            SizedBox(
              width: Get.width,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  await controllerA.resetPassword(email.text);
                  Get.to(Login(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.fadeIn);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "Submit",
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
          ],
        ),
      ),
    );
  }
}
