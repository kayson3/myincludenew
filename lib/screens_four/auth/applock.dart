import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_four/home.dart';
import 'package:includenew/widgets/button.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class AppLock extends StatelessWidget {
  AppLock({super.key});

  RxBool obscurePassword = true.obs;

  TextEditingController pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RxString text = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: whiteColor,F
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                      'Turn on your biometric & create App lock PIN\nfor your account.',
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
                              Constants.store.write("PIN", text.value);
                              Get.to(() => Home());
                            }
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
