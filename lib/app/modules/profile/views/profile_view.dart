import 'package:dghome3d/app/modules/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controllers/auth_controller.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final controllerA = Get.put(AuthController());
  User? user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            await controllerA.logoutWithGG();
            await controllerA.logoutWithFB();
            await controllerA.signOut();
            Get.to(HomeView(),
                duration: const Duration(seconds: 1),
                transition: Transition.fadeIn);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (user!.phoneNumber == null) ...[
              Text(
                "Name: ${user!.displayName}",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#1C1C1C"),
                ),
              ),
              Text(
                "Email: ${user!.email}",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#1C1C1C"),
                ),
              )
            ] else ...[
              Text(
                "Phone: ${user!.phoneNumber!.substring(3).padLeft(10, '0')}",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#1C1C1C"),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
