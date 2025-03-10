import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/screens/auth/verify.dart';
// import 'package:includenew/screens/verify.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../constants.dart';
import '../../widgets/text.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final authController = Get.put(LoginController());

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordControllr = TextEditingController();

  final emaicontrollr = TextEditingController();

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
          child: SingleChildScrollView(
            child: SizedBox(
              height: 952,
              child: Obx(
                () => Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      height: 184,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          color: Constants.cardbgColor(),
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Constants.cardImage().isEmpty
                                ? const AssetImage('assets/images/authcard.png')
                                : NetworkImage(Constants.cardImage())
                                    as ImageProvider<Object>,
                            fit: BoxFit.fill,
                            opacity: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            const Spacer(),
                            Text(
                              'Signup',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Sign up your account for free, get access to different financial services',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            const Spacer(),
                          ],
                        ),
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
                          'Full Name',
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
                        hintText: 'Enter first & last name',
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains(' ')) {
                            return 'Enter both firstname and lastname';
                          }
                          return null;
                        },
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextInputField(
                          hintText: 'e.g samson@fuspay.us',
                          keyboardType: TextInputType.emailAddress,
                          controller: emaicontrollr,
                          validator: Constants.validateEmail),
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextInputField(
                        hintText: 'e.g +2348140230567',
                        keyboardType: TextInputType.phone,
                        controller: phonecontroller,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('+')) {
                            return 'field must contain "+234"';
                          }
                          return null;
                        },
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Obx(
                        () => TextInputField(
                          hintText: 'e.g *********',
                          obscurePassword: obscurePassword.value,
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
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Obx(
                          () => Button(
                              buttonText: 'Sign Up',
                              buttonWidth: 134,
                              isLoading: isLoading.value,
                              color: Constants.btnColor(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  authController
                                      .register(
                                    firstname:
                                        namecontroller.text.split(' ').first,
                                    lastname:
                                        namecontroller.text.split(' ').last,
                                    password: passwordControllr.text,
                                    phone: phonecontroller.text,
                                    email: emaicontrollr.text,
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
                    const Spacer(),
                    Text(
                      'I already have an account?',
                      style: TextStyle(
                          color: Constants.txtSecColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Constants.btnColor(), width: 2)),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Constants.btnSecColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
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
