import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/resetpassword.dart';
import 'package:includenew/widgets/dialog.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RecoveryCode extends StatelessWidget {
  RecoveryCode({super.key}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.dialog(SuccessfulDialogs(
        title: 'Sent',
        description: 'Please check your sms for the recovery code',
        showloader: true,
        loaderColor: const Color(0xff232D51),
      ));
    });
  }

  // final pinController = TextEditingController();

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
        child: Obx(
          () => ModalProgressHUD(
            inAsyncCall: isLoading.value,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
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
                              'Recovery Code',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Please enter the 4-digit recovery code sent to you',
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
                    SizedBox(
                      width: 300,
                      child: PinCodeTextField(
                        // controller: pinController,
                        appContext: context,
                        length: 6,
                        textStyle: TextStyle(color: Constants.txtSecColor()),
                        keyboardType: TextInputType.phone,
                        cursorColor: const Color(0xffAEACAC),
                        onChanged: (v) {},
                        onCompleted: (v) {
                          isLoading.value = true;
                          authController
                              .forgotpasswordverify(code: v)
                              .then((value) {
                            isLoading.value = false;

                            if (value) {
                              Get.to(() => ResetPassword());
                            }
                            return null;
                          });
                        },
                        pinTheme: PinTheme(
                          // borderRadius: BorderRadius.circular(6),
                          shape: PinCodeFieldShape.circle,
                          selectedColor: const Color(0xffAEACAC),
                          inactiveColor: const Color(0xffAEACAC),
                          selectedFillColor: const Color(0xffAEACAC),
                          inactiveFillColor: const Color(0xffAEACAC),
                          activeColor: const Color(0xffAEACAC),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //     child: Button(
                    //       buttonText: 'Complete',
                    //       buttonWidth: 134,
                    //       onTap: () {
                    //         Get.to(() => ResetPassword());
                    //       },
                    //     ),
                    //   ),
                    // ),
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
