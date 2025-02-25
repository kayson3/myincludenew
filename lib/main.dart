import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/onboard.dart';
import 'package:includenew/screens/auth/unlock.dart';
import 'package:includenew/screens/home.dart';
import 'package:includenew/screens_four/auth/onboard.dart' as temp4;
import 'package:includenew/screens_four/home.dart' as hometemp4;
import 'package:includenew/screens_three/auth/onboard.dart' as temp3;
import 'package:includenew/screens_three/auth/unlock.dart' as unlocktemp3;
import 'package:includenew/screens_three/home.dart' as hometemp3;
import 'package:includenew/screens_two/auth/onboard.dart' as temp2;
import 'package:includenew/screens_two/auth/unlock.dart' as unlocktemp2;
import 'package:includenew/screens_two/home.dart' as hometemp2;

Future<void> main() async {
  final authController = Get.put(LoginController());
  await GetStorage.init();
  await authController.getDesign();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Change the status bar color
      // statusBarBrightness: Brightness.dark, // Change the status bar brightness
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Include',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,

          // inputDecorationTheme: InputDecorationTheme(col)
        ), //  SvgPicture.network(Constants.applogo()) as Image
        home: EasySplashScreen(
          logo: Constants.applogo().isEmpty
              ? Image.asset(
                  'assets/images/ico.png',
                  height: 47,
                  width: 47,
                )
              : Image.network(
                  Constants.applogo(),
                  height: 47,
                  width: 47,
                ),
          title: const Text(
            "",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Constants.splashbgColor(),
          showLoader: false,
          loadingText: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Infrastructure by \n',
                  style: TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 6.95,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    // height: 0.38,
                  ),
                ),
                TextSpan(
                  text: 'Fuspay Technology',
                  style: TextStyle(
                    color: Color(0xFF1E3F52),
                    fontSize: 10.04,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    // height: 0.18,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          navigator: Constants.store.read("TOKEN") == null
              ? Constants.designtemplate == "Template 1"
                  ? OnBoard()
                  : Constants.designtemplate == "Template 2"
                      ? temp2.OnBoard()
                      : Constants.designtemplate == "Template 3"
                          ? temp3.OnBoard()
                          : temp4.OnBoard()
              : Constants.store.read("PIN") == null
                  ? Constants.designtemplate == "Template 1"
                      ? Home()
                      : Constants.designtemplate == "Template 2"
                          ? hometemp2.Home()
                          : Constants.designtemplate == "Template 3"
                              ? hometemp3.Home()
                              : hometemp4.Home()
                  : Constants.designtemplate == "Template 1"
                      ? Unlock()
                      : Constants.designtemplate == "Template 2"
                          ? unlocktemp2.Unlock()
                          : Constants.designtemplate == "Template 3"
                              ? unlocktemp3.Unlock()
                              : hometemp4.Home(),

          // Unlock(),
          durationInSeconds: 5,
        ));
  }
}
