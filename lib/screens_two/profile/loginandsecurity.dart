import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/dialog.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/text.dart';

import '../../widgets/button.dart';

class Security extends StatelessWidget {
  Security({super.key});

  RxBool obscurePassword = true.obs;

  final currentpassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
          height: MediaQuery.sizeOf(context).height / 1.27,
          decoration: BoxDecoration(
              color: Constants.bgSecColor(),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(32))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 4,
                        width: 112,
                        decoration:
                            const BoxDecoration(color: Color(0xffCBCACA)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Login & Security',
                      style: TextStyle(
                          color: Constants.txtSecColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 19),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Reset your login Password',
                      style: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Current Password:',
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextInputField(
                        hintText: 'Enter current password',
                        obscurePassword: obscurePassword.value,
                        controller: currentpassword,
                        validator: (v) {
                          if (v.toString().isEmpty) {
                            return "Password cannot be empty";
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
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'New Password:',
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextInputField(
                        hintText: 'Enter new password',
                        obscurePassword: obscurePassword.value,
                        controller: newPassword,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Confirm New Password:',
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextInputField(
                        hintText: 'Re-type new password',
                        obscurePassword: obscurePassword.value,
                        controller: confirmNewPassword,
                        validator: (v) {
                          if (v.toString() != newPassword.text) {
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
                    if (authController.errorMessage.value.isNotEmpty)
                      const SizedBox(
                        height: 5,
                      ),
                    if (authController.errorMessage.value.isNotEmpty)
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: authController.errorMessage.value,
                          color: Colors.red,
                        ),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    // const Spacer(),
                    Obx(
                      () => Button(
                        buttonWidth: 134,
                        buttonText: 'Submit',
                        color: Constants.btnColor(),
                        isLoading: isLoading.value,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            isLoading.value = true;
                            authController
                                .resetpassword(
                                    newpassword: confirmNewPassword.text,
                                    oldpassword: currentpassword.text)
                                .then((value) {
                              isLoading.value = false;
                              if (value) {
                                if (Get.isBottomSheetOpen!) Get.back();

                                Get.dialog(SuccessfulDialogs(
                                  showloader: false,
                                  showclose: true,
                                  title: 'Success',
                                  description: 'Updated Successfully',
                                ));
                              }
                              return null;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
