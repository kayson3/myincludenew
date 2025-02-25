import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/screens_four/auth/applock.dart';
import 'package:includenew/screens_four/auth/forgotpassword.dart';
import 'package:includenew/screens_four/auth/signup.dart';
import 'package:includenew/screens_four/auth/verify.dart';
// import 'package:includenew/screens_four/signup.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../constants.dart';
import '../../widgets/text.dart';

class Login extends StatelessWidget {
  Login({super.key});
  RxBool obscurePassword = true.obs;

  final authController = Get.put(LoginController());

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordControllr = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(HF
      //   backgroundColor: whiteColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Form(
          key: formKey,
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
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Constants.btnColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login to your\naccount.',
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
                        controller: phonecontroller,
                        filledColor: Constants.txtColor()!.withOpacity(0.1),
                        borderColor: Colors.transparent,
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
                      height: 20,
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
                          filledColor: Constants.txtColor()!.withOpacity(0.1),
                          radius: 10,
                          borderColor: Colors.transparent,
                          validator: (value) {
                            return Constants.validatePassword(value);
                          },
                          controller: passwordControllr,
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
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot Password? ',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  color: Constants.btnColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 60,
                    // ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Obx(
                          () => Button(
                              buttonText: 'LOGIN',
                              buttonWidth: 124,
                              height: 43,
                              isLoading: isLoading.value,
                              color: Constants.btnColor(),
                              radius: 22,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  authController
                                      .login(
                                    password: passwordControllr.text,
                                    phone: phonecontroller.text,
                                  )
                                      .then((value) {
                                    isLoading.value = false;
                                    if (authController.errorMessage.value ==
                                        "Please verify your account to proceed") {
                                      Get.to(() => Verify());
                                    }
                                    if (value) {
                                      //  return Get.to(() => FacialC());
                                      // Get.to(() => Home());

                                      if (Constants.store.read("googleAuth") ==
                                          true) {
                                        Get.to(() => Verify(
                                              is2fa: true,
                                            ));
                                      } else {
                                        Get.to(() => AppLock());
                                      }

                                      // return Get.to(() => FacialC());
                                    }
                                    return null;
                                  });
                                }
                              }),
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
                            'Don’t have an account? ',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignUp());
                            },
                            child: Text(
                              'Sign Up',
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
                    //   'Don’t have an account?',
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
                    //     Get.to(() => SignUp());
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
                    //         'Sign Up',
                    //         style: TextStyle(
                    //             color: Color(0xff8F94A6),
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 14),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
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
