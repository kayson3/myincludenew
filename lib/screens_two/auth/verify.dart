import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_two/auth/applock.dart';
import 'package:includenew/screens_two/auth/login.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../widgets/text.dart';

class Verify extends StatelessWidget {
  bool? is2fa;
  Verify({super.key, this.is2fa});

  RxBool obscurePassword = true.obs;

  final otpController = TextEditingController();
  final emailotpController = TextEditingController();

  RxBool isLoading = false.obs;

  final authController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  RxInt _secondsRemainingphone = 0.obs; // Initial countdown duration
  Timer? _timerphone;

  RxInt _secondsRemainingemail = 0.obs; // Initial countdown duration
  Timer? _timeremail;

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
            Positioned(
                bottom: 0, child: Image.asset("assets/images/cardtemp2.png")),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(
                    () => Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),

                        // Container(
                        //   height: 184,
                        //   width: double.infinity,
                        //   margin: const EdgeInsets.symmetric(horizontal: 25),
                        //   decoration: BoxDecoration(
                        //       // color: Colors.amber,
                        //       color: Constants.cardbgColor(),
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 20),
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: Constants.storeDesign
                        //                 .read("ACCOUNTDESIGN")['design']['card_image']
                        //                 .toString()
                        //                 .isEmpty
                        //             ? const AssetImage('assets/images/authcard.png')
                        //             : NetworkImage(Constants.store
                        //                     .read("ACCOUNTDESIGN")['design']
                        //                 ['card_image']) as ImageProvider<Object>,
                        //         fit: BoxFit.fill,
                        //         opacity: 0.8,
                        //       ),
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       // mainAxisAlignment: MainAxisAlignment.,
                        //       children: [
                        //         const Spacer(),

                        //         const Spacer(),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              is2fa == true ? "Verify" : 'Verify Information',
                              style: TextStyle(
                                  color: Constants.txtColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              is2fa == true
                                  ? "Paste code from your auth app"
                                  : 'Click get code to get OTP to verify your info.',
                              style: TextStyle(
                                  color: Constants.txtSecColor(),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: Text(
                        //       'Password:',
                        //       style: TextStyle(
                        //           color: Constants.txtColor(),
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 14),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Obx(
                        //     () => TextInputField(
                        //       hintText: 'Enter  password',
                        //       obscurePassword: obscurePassword.value,
                        //       suffixIcon: IconButton(
                        //         onPressed: () {
                        //           obscurePassword.value = !obscurePassword.value;
                        //         },
                        //         icon: obscurePassword.value
                        //             ? const Icon(
                        //                 Feather.eye_off,
                        //                 color: Color(0xff292D32),
                        //               )
                        //             : const Icon(
                        //                 Feather.eye,
                        //                 color: Color(0xff292D32),
                        //               ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: Text(
                        //       'Confirm Password:',
                        //       style: TextStyle(
                        //           color: Constants.txtColor(),
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 14),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Obx(
                        //     () => TextInputField(
                        //       hintText: 'Retype password',
                        //       obscurePassword: obscurePassword.value,
                        //       suffixIcon: IconButton(
                        //         onPressed: () {
                        //           obscurePassword.value = !obscurePassword.value;
                        //         },
                        //         icon: obscurePassword.value
                        //             ? const Icon(
                        //                 Feather.eye_off,
                        //                 color: Color(0xff292D32),
                        //               )
                        //             : const Icon(
                        //                 Feather.eye,
                        //                 color: Color(0xff292D32),
                        //               ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              is2fa == true ? "Enter Code" : 'Verify Phone',
                              style: TextStyle(
                                  color: Constants.txtColor(),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextInputField(
                            hintText: is2fa == true
                                ? 'e.g 0 0 0 0 0 0'
                                : "Enter OTP code",
                            // obscurePassword: obscurePassword.value,
                            controller: otpController,
                            keyboardType: TextInputType.phone,
                            maxLength: 6,

                            suffixIcon: Obx(
                              () => GestureDetector(
                                onTap: () async {
                                  if (_secondsRemainingphone.value != 0) {
                                  } else {
                                    _secondsRemainingphone.value = 60;
                                    _timerphone = Timer.periodic(
                                        const Duration(seconds: 1), (timer) {
                                      if (_secondsRemainingphone > 0) {
                                        _secondsRemainingphone--;
                                        _secondsRemainingphone.refresh();
                                      } else {
                                        timer.cancel();
                                        _timerphone?.cancel();
                                        // Handle countdown completion here
                                      }
                                    });
                                    authController
                                        .requestverification(field: "phone")
                                        .then((value) {
                                      if (value) {
                                      } else {
                                        _secondsRemainingphone.value = 0;
                                      }
                                      return null;
                                    });
                                  }
                                },
                                child: SizedBox(
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      _secondsRemainingphone.value == 0
                                          ? 'Get Code '
                                          : "0:${_secondsRemainingphone.value}",
                                      style: const TextStyle(
                                          color: Color(0xff90929B),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Verify Email',
                              style: TextStyle(
                                  color: Constants.txtColor(),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextInputField(
                            hintText: 'Enter OTP code',
                            // obscurePassword: obscurePassword.value,
                            controller: emailotpController,
                            keyboardType: TextInputType.phone,
                            maxLength: 6,
                            validator: (v) {
                              if (v == null || v.isEmpty || v.length < 6) {
                                return "input code";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: Obx(
                              () => GestureDetector(
                                onTap: () async {
                                  if (_secondsRemainingemail.value != 0) {
                                  } else {
                                    _secondsRemainingemail.value = 60;
                                    _timeremail = Timer.periodic(
                                        const Duration(seconds: 1), (timer) {
                                      if (_secondsRemainingemail > 0) {
                                        _secondsRemainingemail--;
                                        _secondsRemainingemail.refresh();
                                      } else {
                                        timer.cancel();
                                        _timeremail?.cancel();
                                        // Handle countdown completion here
                                      }
                                    });
                                    authController
                                        .requestverification(field: "email")
                                        .then((value) {
                                      if (value) {
                                      } else {
                                        _secondsRemainingemail.value = 0;
                                      }
                                      return null;
                                    });
                                  }
                                },
                                child: SizedBox(
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      _secondsRemainingemail.value == 0
                                          ? 'Get Code '
                                          : "0:${_secondsRemainingemail.value}",
                                      style: const TextStyle(
                                          color: Color(0xff90929B),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (authController.errorMessage.value.isNotEmpty)
                          const SizedBox(
                            height: 5,
                          ),
                        if (authController.errorMessage.value.isNotEmpty)
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: CustomText(
                                text: authController.errorMessage.value,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 17,
                        ),
                        if (is2fa != true)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Text(
                                  'Didn’t get code? ',
                                  style: TextStyle(
                                      color: Constants.txtSecColor(),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Resend',
                                  style: TextStyle(
                                      color: Constants.txtSecColor(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Obx(
                              () => Button(
                                buttonText: 'Verify',
                                buttonWidth: MediaQuery.sizeOf(context).width,
                                isLoading: isLoading.value,
                                color: Constants.btnColor(),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    isLoading.value = true;

                                    if (is2fa == true) {
                                      authController
                                          .verify2fa(
                                              code: otpController.text.trim())
                                          .then((value) {
                                        isLoading.value = false;
                                        if (value) {
                                          return Get.to(() => AppLock());
                                        }
                                        return null;
                                      });
                                    } else {
                                      authController
                                          .verifyall(
                                              phoncode:
                                                  otpController.text.trim(),
                                              emailcode: emailotpController.text
                                                  .trim())
                                          .then((value) {
                                        isLoading.value = false;
                                        if (value) {
                                          return Get.to(() => Login());
                                        }
                                        return null;
                                      });
                                      // authController
                                      //     .verify(
                                      //         code: emailotpController.text.trim(),
                                      //         field: "email")
                                      //     .then((value) {
                                      //   isLoading.value = false;
                                      //   if (value) {
                                      //     return Get.to(() => Login());
                                      //   }
                                      //   return null;
                                      // });
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'I already have an account? ',
                                style: TextStyle(
                                    color: Constants.txtSecColor(),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Constants.txtSecColor(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   'I already have an account?',
                        //   style: TextStyle(
                        //       color: Constants.txtSecColor(),
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 14),
                        // ),
                        // const SizedBox(
                        //   height: 17,
                        // ),
                        // GestureDetector(
                        //   behavior: HitTestBehavior.opaque,
                        //   onTap: () {
                        //     Get.back();
                        //   },
                        //   child: Container(
                        //     width: 74,
                        //     height: 74,
                        //     decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         border: Border.all(
                        //             color: Constants.btnColor(), width: 2)),
                        //     child: const Center(
                        //       child: Text(
                        //         'Login',
                        //         style: TextStyle(
                        //             color: Color(0xff8F94A6),
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 14),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
