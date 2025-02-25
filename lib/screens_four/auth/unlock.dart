import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:includenew/screens_four/auth/login.dart';
import 'package:includenew/screens_four/home.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

import '../../constants.dart';
import '../../widgets/button.dart';

class Unlock extends StatelessWidget {
  Unlock({super.key});

  TextEditingController pinController = TextEditingController();
  RxString text = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: whiteColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // Align(
                      //     alignment: Alignment.topLeft,
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 25),
                      //       child: GestureDetector(
                      //           onTap: () {
                      //             Get.back();
                      //           },
                      //           child: Icon(Icons.arrow_back_ios,
                      //               color: Constants.btnColor())),
                      //     )),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      const SizedBox(
                        height: 30,
                      ),

                      Image.asset(
                        "assets/images/temp_four/logingraphic.png",
                        width: 123,
                        height: 101,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'VERIFICATION REQUIRED',
                        style: TextStyle(
                            color: Constants.btnColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'App Lock PIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w800,
                            fontSize: 34),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Enter ypur App Lock PIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            text.value.isEmpty ? "xxxx" : text.value,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      NumericKeyboard(
                          onKeyboardTap: (v) {
                            if (text.value.length > 3) return;
                            text.value += v;
                          },
                          textStyle: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                          rightButtonFn: () {
                            if (text.value.isEmpty) return;

                            text.value =
                                text.value.substring(0, text.value.length - 1);
                          },
                          rightButtonLongPressFn: () {
                            if (text.value.isEmpty) return;

                            text.value = '';
                          },
                          rightIcon: const Icon(
                            Icons.arrow_back,
                            // color: Colors.red,
                          ),
                          leftButtonFn: () {
                            if (text.value.contains(".")) return;
                            text.value = "${text.value}.";
                          },
                          leftIcon: Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              color: Color(0xff000000),
                              shape: BoxShape.circle,
                            ),
                          ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                      const SizedBox(
                        height: 17,
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Button(
                            buttonText: 'Verify',
                            buttonWidth: 216,
                            height: 47,
                            radius: 20,
                            color: Constants.btnColor(),
                            onTap: () {
                              if (text.value.length == 4) {
                                if (text.value.toString() ==
                                    Constants.store.read("PIN")) {
                                  Get.to(() => Home());
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Incorrect PIN",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 14.0);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      const Spacer(),

                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Forgot PIN? ',
                              style: TextStyle(
                                  color: Constants.txtColor(),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Constants.store.erase();
                                Get.offAll(Login());
                              },
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),
                    ],
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
