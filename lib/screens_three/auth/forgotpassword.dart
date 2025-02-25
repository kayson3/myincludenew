import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_three/auth/recovery.dart';
import 'package:includenew/widgets/text.dart';

import '../../apis/auth.dart';
import '../../widgets/button.dart';
import '../../widgets/inputfield.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  TextEditingController phonecontroller = TextEditingController();

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
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
            child: Form(
              key: formKey,
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
                    //                 .read("ACCOUNTDESIGN")['design']
                    //                     ['card_image']
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
                    //           'Forget Password',
                    //           style: TextStyle(
                    //               color: Constants.cardTextColor(),
                    //               fontWeight: FontWeight.w700,
                    //               fontSize: 25),
                    //         ),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //         Text(
                    //           'Reset your forget password',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Reset your  password',
                        style: TextStyle(
                            color: Constants.txtSecColor(),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Phone number',
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
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('+')) {
                            return 'field must contain "+234"';
                          }
                          return null;
                        },
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Constants.btnColor(),
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
                      height: 50,
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
                                    .requestCode(phone: phonecontroller.text)
                                    .then((value) {
                                  isLoading.value = false;
                                  authController.phonee = phonecontroller.text;
                                  if (value) {
                                    Get.to(() => RecoveryCode());
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
        ),
      ),
    );
  }
}
