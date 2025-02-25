import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/login.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/text.dart';

import '../../widgets/dialog.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  RxBool obscurePassword = true.obs;

  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmnewpassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final authController = Get.put(LoginController());
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
        child: Stack(
          children: [
            Positioned(
                bottom: 0, child: Image.asset("assets/images/cardtemp2.png")),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Reset Password',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Enter a new password to continue',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
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
                      //         Text(
                      //           'Reset Password',
                      //           style: TextStyle(
                      //               color: Constants.cardTextColor(),
                      //               fontWeight: FontWeight.w700,
                      //               fontSize: 25),
                      //         ),
                      //         const SizedBox(
                      //           height: 20,
                      //         ),
                      //         Text(
                      //           'Enter a new password to continue',
                      //           style: TextStyle(
                      //               color: Constants.cardTextColor(),
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 14),
                      //         ),
                      //         const Spacer(),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'New Password:',
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
                            hintText: 'Enter new password',
                            obscurePassword: obscurePassword.value,
                            controller: newpassword,
                            validator: Constants.validatePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscurePassword.value = !obscurePassword.value;
                              },
                              icon: obscurePassword.value
                                  ? const Icon(
                                      Feather.eye_off,
                                      color: Color(0xff292D32),
                                    )
                                  : const Icon(
                                      Feather.eye,
                                      color: Color(0xff292D32),
                                    ),
                            ),
                          ),
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
                            'Confirm New Password:',
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
                            hintText: 'Re-type new password',
                            obscurePassword: obscurePassword.value,
                            controller: confirmnewpassword,
                            validator: (v) {
                              if (v.toString() != newpassword.text) {
                                return "Password not match";
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscurePassword.value = !obscurePassword.value;
                              },
                              icon: obscurePassword.value
                                  ? const Icon(
                                      Feather.eye_off,
                                      color: Color(0xff292D32),
                                    )
                                  : const Icon(
                                      Feather.eye,
                                      color: Color(0xff292D32),
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
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Obx(
                            () => Button(
                              buttonText: 'Complete',
                              buttonWidth: MediaQuery.sizeOf(context).width,
                              color: Constants.btnColor(),
                              isLoading: isLoading.value,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  authController
                                      .forgotpassword(
                                          password: confirmnewpassword.text)
                                      .then((value) {
                                    isLoading.value = false;

                                    if (value) {
                                      Get.dialog(
                                          SuccessfulDialogs(
                                            title:
                                                'Password successfully updated!',
                                            description:
                                                'You will now be redirected to the log in screen',
                                            showloader: true,
                                            showclose: false,
                                            loaderColor:
                                                const Color(0xffB2B1B1),
                                          ),
                                          barrierDismissible: false);

                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        Get.offAll(Login());
                                      });
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
