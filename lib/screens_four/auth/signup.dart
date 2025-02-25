import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/screens_four/auth/verify.dart';
// import 'package:includenew/screens_four/verify.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../constants.dart';
import '../../widgets/text.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final authController = Get.put(LoginController());

  final emaicontrollr = TextEditingController();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordControllr = TextEditingController();

  final pinControllr = TextEditingController();

  RxBool obscurePassword = true.obs;

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

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
        bottom: true,
        child: Form(
          key: formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Obx(
              () => ListView(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                  Center(
                    child: Text(
                      'WELCOME',
                      style: TextStyle(
                          color: Constants.btnColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create an account\nfor free',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w800,
                        fontSize: 34),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Constants.txtColor()!.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextInputField(
                          hintText: 'First name',
                          controller: namecontroller,
                          borderColor: Colors.transparent,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains(' ')) {
                              return 'Enter both firstname and lastname';
                            }
                            return null;
                          },
                          // border: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Constants.btnColor(),
                          //   ),
                          // ),
                        ),
                        Container(
                            height: 1,
                            color: Constants.txtColor()!.withOpacity(0.3)),
                        TextInputField(
                          hintText: 'Last name',
                          controller: namecontroller,
                          borderColor: Colors.transparent,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains(' ')) {
                              return 'Enter both firstname and lastname';
                            }
                            return null;
                          },
                          // border: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Constants.btnColor(),
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextInputField(
                      hintText: 'e.g samson@fuspay.us',
                      keyboardType: TextInputType.emailAddress,
                      borderColor: Colors.transparent,
                      controller: emaicontrollr,
                      validator: Constants.validateEmail,
                      filledColor: Constants.txtColor()!.withOpacity(0.1),
                      radius: 10,
                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Constants.btnColor(),
                      //   ),
                      // ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextInputField(
                      hintText: 'e.g +2348140230567',
                      keyboardType: TextInputType.phone,
                      borderColor: Colors.transparent,
                      controller: phonecontroller,
                      filledColor: Constants.txtColor()!.withOpacity(0.1),
                      radius: 10,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('+')) {
                          return 'field must contain "+234"';
                        }
                        return null;
                      },
                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Constants.btnColor(),
                      //   ),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Obx(
                      () => TextInputField(
                        hintText: 'e.g *********',
                        obscurePassword: obscurePassword.value,
                        borderColor: Colors.transparent,
                        validator: (value) {
                          return Constants.validatePassword(value);
                        },
                        controller: passwordControllr,
                        filledColor: Constants.txtColor()!.withOpacity(0.1),
                        radius: 10,
                        suffixIcon: IconButton(
                          onPressed: () {
                            obscurePassword.value = !obscurePassword.value;
                          },
                          icon: obscurePassword.value
                              ? Icon(
                                  Feather.eye_off,
                                  color: Constants.txtSecColor(),
                                )
                              : Icon(
                                  Feather.eye,
                                  color: Constants.txtSecColor(),
                                ),
                        ),
                        // border: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Constants.btnColor(),
                        //   ),
                        // ),
                      ),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       'Wallet pin',
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
                  //       hintText: 'e.g ****',
                  //       obscurePassword: obscurePassword.value,
                  //       validator: (v) {
                  //         if (v == null || v.isEmpty) {
                  //           return "Please input pin";
                  //         } else if (v.length < 4) {
                  //           return "input 4 digit pin";
                  //         }
                  //         return null;
                  //       },
                  //       controller: pinControllr,
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'By clicking Signup, you accept our Terms & Condition',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Obx(
                        () => Button(
                            buttonText: 'Sign Up',
                            buttonWidth: 124,
                            height: 43,
                            isLoading: isLoading.value,
                            color: Constants.btnColor(),
                            radius: 22,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                isLoading.value = true;
                                authController
                                    .register(
                                  firstname:
                                      namecontroller.text.split(' ').first,
                                  email: emaicontrollr.text,
                                  lastname: namecontroller.text.split(' ').last,
                                  password: passwordControllr.text,
                                  phone: phonecontroller.text,
                                  // pin: pinControllr.text,
                                )
                                    .then((value) {
                                  isLoading.value = false;
                                  if (value) {
                                    Get.to(() => Verify());
                                  }
                                  return null;
                                });
                              }
                            }),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 17,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //     children: const [
                  //       Text(
                  //         'Forgot Password? ',
                  //         style: TextStyle(
                  //             color: Constants.txtSecColor(),
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 14),
                  //       ),
                  //       Text(
                  //         'Reset',
                  //         style: TextStyle(
                  //             color: Constants.txtSecColor(),
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 14),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),

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
                                color: Constants.btnColor(),
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
