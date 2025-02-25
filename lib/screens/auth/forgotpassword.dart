import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/recovery.dart';
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
                            image: Constants.cardImage().toString().isEmpty
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
                              'Forget Password',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Reset your forget password',
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
                          'Phone number',
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Obx(
                          () => Button(
                            buttonText: 'Complete',
                            buttonWidth: 134,
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
