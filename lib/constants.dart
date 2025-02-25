import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class Constants {
  static Logger logger = Logger();
  static String baseUrl = //
      'https://include-prod-4295e3df49cd.herokuapp.com/api/v1/'; //https://include-stage-89c7b78dfc34.herokuapp.com/api/v1/ //https://include-prod-4295e3df49cd.herokuapp.com/api/v1/

  static String checkouturlUrl =
      "https://finswich-checkout-v2.fuspay.finance/wallet"; //https://finswich-checkout-v2.fuspay.finance/wallet
  // 'https://checkout-1.fuspay.finance'; //https://fin-swich-checkout.vercel.app

  static final store = GetStorage();

  static final storeDesign = GetStorage('storeDesign');

  static final oCcyy = NumberFormat("#,##0.00", "en_US"); //"#,##0.00"
  static String moneyFormat(dynamic money) {
    return oCcyy.format(money);
  }

  static String getImage({image}) {
    return "${Constants.baseUrl}user/getimage?imageName=$image";
  }

  static RxDouble usersLatitude = 0.0.obs;
  static RxDouble usersLongitude = 0.0.obs;

  // static Future<void> llaunchUrl(url) async {
  //   if (!await launchUrl(Uri.parse(url))) {
  //     throw Exception('Could not launch $url');
  //   }
  // } joel-app.

  static String capitalizeText({required String inputText}) {
    String capitalizedText = inputText.toLowerCase().split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
    return capitalizedText;
  }

  // static Future<String> croptoDesired({required String imageFile}) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: imageFile,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: const Color(0xFF6117B2),
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: true),
  //       IOSUiSettings(
  //         title: 'Cropper',
  //       ),
  //       WebUiSettings(
  //         context: Get.context!,
  //       ),
  //     ],
  //   );
  //   return croppedFile!.path;
  // }

  static shimmer(
      {required Widget child, Color? baseColor, Color? highlightColor}) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.red,
        highlightColor: highlightColor ?? Colors.yellow,
        child: child,
      ),
    );
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special symbol';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email is required";
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  static List<Map<String, dynamic>> getUniqueelementavailableTime(serverList) {
    // List<Map<String, dynamic>> listOfMaps = [
    //   {'id': 1, 'name': 'John'},
    //   {'id': 2, 'name': 'Alice'},
    //   {'id': 1, 'name': 'John'}, // Duplicate based on 'id' key
    //   {'id': 3, 'name': 'Bob'},
    // ];

    List<Map<String, dynamic>> uniqueList = [];

    Set<dynamic> seen = <dynamic>{};

    for (var map in serverList) {
      if (!seen.contains(map['start'])) {
        uniqueList.add(map);
        seen.add(map['start']);
      }
    }

    return uniqueList;
  }

  static var paystackkey = 'sk_test_2a86860ef312be9e1be1e5b59384f9b9c498266b';

  static String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  static String replaceFirstChar(String text, String replacement) {
    if (text.isEmpty) {
      return text;
    }
    return replacement + text.substring(1);
  }

  static Color? cardTextColor() {
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['other_color']['card_text_color']
            .toString()
            .isEmpty
        ? Colors.black
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['other_color']
                    ['card_text_color']
                .toString(),
            "0xff")));
  }

  static Color? cardbgColor() {
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['other_color']['card_bg_color']
            .toString()
            .isEmpty
        ? const Color(0xffAFAFAF).withOpacity(0.16)
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['other_color']['card_bg_color']
                .toString(),
            "0xff")));
  }

  static Color bgColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['bg_color']['primary_color']
            .toString()
            .isEmpty
        ? Colors.white
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['bg_color']['primary_color']
                .toString(),
            "0xff")));
  }

  static Color bgSecColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['bg_color']['secondary_color']
            .toString()
            .isEmpty
        ? Colors.white
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['bg_color']['secondary_color']
                .toString(),
            "0xff")));
  }

  static Color splashbgColor() {
    if (!storeDesign
        .read("ACCOUNTDESIGN")['design']
        .containsKey("splash_screen")) {
      return Colors.white;
    }
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['splash_screen']
                ['background_color']
            .toString()
            .isEmpty
        ? Colors.white
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['splash_screen']
                    ['background_color']
                .toString(),
            "0xff")));
  }

  static Color? txtColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['text_color']['primary_color']
            .toString()
            .isEmpty
        ? Colors.black
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['text_color']['primary_color']
                .toString(),
            "0xff")));
  }

  static Color? txtSecColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['text_color']['secondary_color']
            .toString()
            .isEmpty
        ? Colors.black26
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['text_color']
                    ['secondary_color']
                .toString(),
            "0xff")));
  }

  static Color btnColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['button_color']['primary_color']
            .toString()
            .isEmpty
        ? const Color(0xff0A59F3)
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['button_color']
                    ['primary_color']
                .toString(),
            "0xff")));
  }

  static Color btnSecColor() {
    // return Colors.pink;
    return storeDesign
            .read("ACCOUNTDESIGN")['design']['button_color']['secondary_color']
            .toString()
            .isEmpty
        ? Colors.white
        : Color(int.parse(replaceFirstChar(
            storeDesign
                .read("ACCOUNTDESIGN")['design']['button_color']
                    ['secondary_color']
                .toString(),
            "0xff")));
  }

  static String applogo() {
    return storeDesign.read("ACCOUNTDESIGN")['design']['app_logo'].toString();
  }

  static String cardImage() {
    return storeDesign.read("ACCOUNTDESIGN")['design']['card_image'].toString();
  }

  static String appAlias() {
    return storeDesign.read("ACCOUNTDESIGN")['design']['app_alias'].toString();
  }

  static Future<void> llaunchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static String designtemplate = storeDesign.read("ACCOUNTDESIGN")['design']
                  ['app_template'] ==
              null ||
          storeDesign
              .read("ACCOUNTDESIGN")['design']['app_template']
              .toString()
              .isEmpty
      ? "Template 1"
      : storeDesign.read("ACCOUNTDESIGN")['design']['app_template'].toString();

  static String lastFour(String str) {
    if (str.length < 4) {
      return str;
    } else {
      return str.substring(str.length - 4);
    }
  }
}
