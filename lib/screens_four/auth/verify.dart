import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_three/auth/applock.dart';
import 'package:includenew/screens_three/auth/login.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../widgets/text.dart';

class Verify extends StatelessWidget {
  bool? is2fa;
  Verify({super.key, this.is2fa});

  RxBool obscurePassword = true.obs;

  final otpController = TextEditingController();

  RxBool isLoading = false.obs;

  final authController = Get.put(LoginController());

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
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Obx(
              () => Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Fontisto.arrow_left_l,
                                color: Constants.btnColor())),
                      )),
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      is2fa == true
                          ? "Paste code from your auth app"
                          : 'Enter the code sent to your phone & set password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Constants.txtSecColor(),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
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
                        'Enter Code',
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
                      hintText: 'e.g 0 0 0 0 0 0',
                      // obscurePassword: obscurePassword.value,
                      controller: otpController,
                      keyboardType: TextInputType.phone,
                      maxLength: 6,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.btnColor(),
                        ),
                      ),

                      suffixIcon: GestureDetector(
                        onTap: () async {
                          otpController.text =
                              (await Clipboard.getData(Clipboard.kTextPlain))!
                                  .text
                                  .toString();

                          ClipboardData? clipboardData =
                              await Clipboard.getData(Clipboard.kTextPlain);

                          if (clipboardData!.text != null) {
                            String? clipboardText = clipboardData.text;

                            // Use a regular expression to extract numbers
                            RegExp regExp = RegExp(r'\d+');
                            Iterable<Match> matches =
                                regExp.allMatches(clipboardText.toString());

                            List<int> numbers = matches
                                .map((match) => int.parse(match.group(0)!))
                                .toList();

                            // Now 'numbers' contains the extracted numbers from the clipboard
                            if (numbers.join().length > 6) {
                              otpController.text =
                                  numbers.join().substring(0, 6);
                            } else {
                              otpController.text = numbers.join();
                            }
                          }
                        },
                        child: const SizedBox(
                          width: 70,
                          child: Center(
                            child: Text(
                              'PASTE',
                              style: TextStyle(
                                  color: Color(0xff90929B),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                            isLoading.value = true;

                            if (is2fa == true) {
                              authController
                                  .verify2fa(code: otpController.text.trim())
                                  .then((value) {
                                isLoading.value = false;
                                if (value) {
                                  return Get.to(() => AppLock());
                                }
                                return null;
                              });
                            } else {
                              authController
                                  .verify(code: otpController.text.trim())
                                  .then((value) {
                                isLoading.value = false;
                                if (value) {
                                  return Get.to(() => Login());
                                }
                                return null;
                              });
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
                  const Spacer(),
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
    );
  }
}
