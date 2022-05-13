import 'package:dghome3d/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart'
    as phoneInput;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';

import '../controllers/phone_controller.dart';
import 'components/verify_phone.dart';

// ignore: must_be_immutable
class PhoneView extends GetView<PhoneController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'VN');

  PhoneView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(PhoneController());
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.inter(
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
            Get.to(HomeView(),
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
                "Phone number",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#575DFB")),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 286,
              height: 19,
              child: Text(
                "Enter your phone number to continue",
                textScaleFactor: 1,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C"),
                ),
              ),
            ),
            const SizedBox(height: 68),
            Text(
              "Phone number",
              textScaleFactor: 1,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1C1C")),
            ),
            const SizedBox(height: 6),
            // PhoneNumberInput
            Container(
              key: _formKey,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
              child: Stack(
                children: [
                  phoneInput.InternationalPhoneNumberInput(
                    textFieldController: phoneNumber,
                    keyboardType: TextInputType.phone,
                    initialValue: number,
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    cursorColor: HexColor("#575DFB"),
                    formatInput: true,
                    selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        trailingSpace: false),
                    inputDecoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 15, left: -15),
                      border: InputBorder.none,
                      hintText: '0912345678',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: Get.width,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  // ignore: unnecessary_null_comparison
                  controller.phoneSignIn("${phoneNumber.text}");
                  Get.to(VerifyPhone(),
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
