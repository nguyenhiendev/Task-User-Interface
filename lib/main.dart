import 'package:dghome3d/app/controllers/auth_controller.dart';
import 'package:dghome3d/app/utils/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:device_preview/device_preview.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final controllerA = Get.put(AuthController());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: "dghome3d",
              theme: ThemeData(scaffoldBackgroundColor: HexColor("#FFFFFF")),
              getPages: AppPages.routes,
              initialRoute:
                  controllerA.isLoggedIn ? Routes.PROFILE : Routes.HOME);
        }
        return const LoadingScreen();
      },
    );
  }
}
