import 'package:dghome3d/app/modules/phone/views/phone_view.dart';
import 'package:dghome3d/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/phone_controller.dart';

// ignore: must_be_immutable
class VerifyPhone extends StatelessWidget {
  VerifyPhone({Key? key}) : super(key: key);
  String? verificationId;
  final otp = TextEditingController();
  final controller = Get.put(PhoneController());
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: HexColor("#575DFB")),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(PhoneView(),
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
            Flexible(
              child: Text(
                "Verify phone number",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#575DFB")),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Text(
                "We have sent a message to your phone with a verification code!",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#1C1C1C")),
              ),
            ),
            const SizedBox(height: 49),
            Flexible(
              child: Text(
                "Verification Code",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#1C1C1C")),
              ),
            ),
            const SizedBox(height: 6),
            // Pinput
            Pinput(
              controller: otp,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: debugPrint,
              defaultPinTheme: defaultPinTheme,
              length: 6,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9.0),
                    width: 56,
                    height: 1,
                    color: HexColor("#575DFB"),
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: HexColor("#575DFB"),
                  ),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: const Color.fromRGBO(243, 246, 249, 0),
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(
                    color: HexColor("#575DFB"),
                  ),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 28),
            //Button submit
            SizedBox(
              width: Get.width,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.getOtp(otp.text);
                  Get.to(Profile(),
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
            )
          ],
        ),
      ),
    );
  }
}
