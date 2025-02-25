import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/kyc.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/text.dart';

import '../../widgets/button.dart';

class KYC extends StatelessWidget {
  KYC({super.key}) {
    Constants.logger.d(Constants.store.read("KYCDATA"));
  }

  RxBool obscurePassword = true.obs;

  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  final kycController = Get.put(KycAPI());

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 535,
        decoration: BoxDecoration(
            color: Constants.bgSecColor(),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Obx(
            () => Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 112,
                      decoration: const BoxDecoration(color: Color(0xffCBCACA)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'KYC',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 19),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Increase your transaction limit by completing your KYC',
                    style: TextStyle(
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // if (Constants.store.read("KYCSUBMITTED") != true) ...[
                  TextInputField(
                    hintText: 'Enter Email',
                    // obscurePassword: obscurePassword.value,
                    controller: emailController,
                    validator: Constants.validateEmail,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Constants.btnColor(),
                      ),
                    ),
                    // suffixIcon: IconButton(
                    //   onPressed: () {
                    //     obscurePassword.value = !obscurePassword.value;
                    //   },
                    //   icon: obscurePassword.value
                    //       ? const Icon(
                    //           Feather.eye_off,
                    //           color: Color(0xff292D32),
                    //         )
                    //       : const Icon(
                    //           Feather.eye,
                    //           color: Color(0xff292D32),
                    //         ),
                    // ),
                  ),
                  if (kycController.errorMessage.value.isNotEmpty)
                    const SizedBox(
                      height: 5,
                    ),
                  if (kycController.errorMessage.value.isNotEmpty)
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: kycController.errorMessage.value,
                        color: Colors.red,
                      ),
                    ),

                  const SizedBox(
                    height: 25,
                  ),
                  // Text(
                  //   'Upload ID Card',
                  //   style: TextStyle(
                  //       color: Constants.txtColor(),
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 14),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // DottedBorder(
                  //   borderType: BorderType.RRect,
                  //   radius: const Radius.circular(12),
                  //   color: const Color(0xffABABAB),
                  //   child: ClipRRect(
                  //     borderRadius: const BorderRadius.all(Radius.circular(8.2)),
                  //     child: Container(
                  //       height: 149,
                  //       width: double.infinity,
                  //       decoration: const BoxDecoration(
                  //         color: whiteColor,
                  //       ),
                  //       child: const Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(MaterialCommunityIcons.camera_enhance,
                  //               color: Color(0xff292D32)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Upload ID card', //
                  //               style: TextStyle(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Color(0xffBEC1CD))),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const Spacer(),
                  Obx(
                    () => Button(
                      buttonWidth: 134,
                      buttonText: 'Submit',
                      isLoading: isLoading.value,
                      color: Constants.btnColor(),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          isLoading.value = true;

                          kycController
                              .startkyc(email: emailController.text)
                              .then((value) {
                            isLoading.value = false;

                            if (value) {
                              if (Get.isBottomSheetOpen!) Get.back();
                              Get.bottomSheet(const KycEmailSubmitted());

                              // Get.dialog(SuccessfulDialogs(
                              //   showloader: false,
                              //   showclose: true,
                              //   title: 'Success',
                              //   description: 'Updated Successfully',
                              // ));
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
        ));
  }
}

class KycEmailSubmitted extends StatelessWidget {
  const KycEmailSubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    return Constants.store.read("KYCSTARTED") == true ? Sc2() : Sc1();
  }
}

class Sc1 extends StatelessWidget {
  Sc1({super.key});
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 535,
      decoration: BoxDecoration(
          color: Constants.bgSecColor(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 4,
                width: 112,
                decoration: const BoxDecoration(color: Color(0xffCBCACA)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Proceed to KYC ',
              style: TextStyle(
                  color: Constants.txtSecColor(),
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Click the link below to continue your KYC. You will be redirected from the app. After you completing your KYC, come back to the app & click “Verify KYC Status”',
              style: TextStyle(
                  color: Color(0xff8B8B8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Button(
                  buttonWidth: 134,
                  buttonText: 'Start KYC',
                  isLoading: isLoading.value,
                  color: Constants.btnColor(),
                  onTap: () {
                    // Constants.llaunchUrl(
                    //     Constants.store.read("KYCDATA")['kyc_url']);

                    Constants.store.write("KYCSTARTED", true);
                    // isLoading.refresh();

                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }

                    // Get.bottomSheet(KYCurl(), isScrollControlled: true);
                    //   isLoading.value = true;

                    //   kycController
                    //       .startkyc(email: emailController.text)
                    //       .then((value) {
                    //     isLoading.value = false;

                    //     if (value) {
                    //       if (Get.isBottomSheetOpen!) Get.back();
                    //       Get.bottomSheet(const KycEmailSubmitted());

                    //       // Get.dialog(SuccessfulDialogs(
                    //       //   showloader: false,
                    //       //   showclose: true,
                    //       //   title: 'Success',
                    //       //   description: 'Updated Successfully',
                    //       // ));
                    //     }
                    //     return null;
                    //   });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Sc2 extends StatelessWidget {
  Sc2({super.key});
  RxBool isLoading = false.obs;

  final kycController = Get.put(KycAPI());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 535,
      decoration: BoxDecoration(
          color: Constants.bgColor(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Obx(
          () {
            isLoading.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 4,
                    width: 112,
                    decoration: const BoxDecoration(color: Color(0xffCBCACA)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Verify KYC Status',
                  style: TextStyle(
                      color: Constants.txtSecColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 19),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Click here to verify your KYC status only if you have complete the KYC process.',
                  style: TextStyle(
                      color: Color(0xff8B8B8B),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 106,
                  // height: 22,
                  padding: const EdgeInsets.all(11.35),
                  decoration: ShapeDecoration(
                    color: const Color(0x5BFFAA7B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.39),
                    ),
                  ),
                  child: Text(
                    Constants.store.read("KYCDATA")['status'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFA76C4C),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      // height: 0.10,
                      // letterSpacing: -0.14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Obx(
                      () => Button(
                          buttonWidth: 158,
                          buttonText: 'Verify My KYC Status',
                          textSize: 14,
                          isLoading: isLoading.value,
                          color: Constants.btnColor(),
                          onTap: () {
                            // Constants.llaunchUrl(
                            //     Constants.store.read("KYCDATA")['kyc_url']);

                            isLoading.value = true;

                            kycController.getkycstatus().then((value) {
                              isLoading.value = false;

                              return null;
                            });
                          }),
                    ),

                    const Spacer(),

                    GestureDetector(
                      onTap: () {
                        // Get.bottomSheet(KYCurl(), isScrollControlled: true);
                      },
                      child: const Text(
                        'Start KYC ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5B5A72),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const Spacer(),
                    //
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
