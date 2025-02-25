import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_two/profile/kyc.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/doneudone.dart';

// ignore: must_be_immutable
class AccountResModal extends StatelessWidget {
  AccountResModal({super.key});

  RxBool facial = false.obs;
  RxBool kyc = false.obs;

  @override
  Widget build(BuildContext context) {
    if (Constants.store.read("KYCDATA")['status'] == "verified") {
      kyc.value = true;
    }
    return Container(
      height: 660,
      decoration: BoxDecoration(
        color: Constants.bgSecColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(44),
          topRight: Radius.circular(44),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Obx(
          () => Column(children: [
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Constants.btnColor(),
                      )),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Constants.btnColor(),
                    size: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            facial.value == true && kyc.value == true
                ? Image.asset('assets/images/unlocked.png')
                : Image.asset('assets/images/notice.png'),
            const SizedBox(
              height: 25,
            ),
            facial.value == true && kyc.value == true
                ? const Text(
                    'Account unlocked',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff429846),
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  )
                : const Text(
                    'Your account is\nrestricted',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffD32E2E),
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '''To unlock your account and start doing transaction, kindly provide your Government Issued Identity (Passport, Driver’s License, Voters Card, National ID etc.)''',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constants.txtSecColor(),
                  fontWeight: FontWeight.w400,
                  fontSize: 13),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            // Row(
            //   children: [
            //     Image.asset(
            //       'assets/images/face.png',
            //       height: 32,
            //       width: 32,
            //     ),
            //     const SizedBox(
            //       width: 15,
            //     ),
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const Text(
            //             'Facial Verification',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 color: Color(0xff232D51),
            //                 fontWeight: FontWeight.w600,
            //                 fontSize: 15),
            //           ),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           Text(
            //             'Let’s capture your face.',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 color: Constants.txtSecColor(),
            //                 fontWeight: FontWeight.w400,
            //                 fontSize: 10),
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 15,
            //     ),
            //     DoneUndoneButton(
            //       done: facial,
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/kyc.png',
                  height: 32,
                  width: 32,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KYC',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Provide Gov.t Issue ID for verification',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Constants.txtSecColor(),
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                DoneUndoneButton(
                  done: kyc,
                  onTap: () {
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                    if (Constants.store.read("KYCSUBMITTED") == true) {
                      Get.bottomSheet(const KycEmailSubmitted());
                    } else {
                      Get.bottomSheet(KYC(), isScrollControlled: true)
                          .then((value) {
                        // return kycdone.value = true;
                      });
                    }
                  },
                )
              ],
            ),
            const Spacer(),
            if (kyc.value == true)
              Button(
                buttonText: 'Continue',
                buttonWidth: 175,
                // color: ,
                onTap: () {
                  Get.back();

                  // Get.bottomSheet(InlineCheckout(),
                  //     isScrollControlled: true, isDismissible: true);
                  // Get.bottomSheet(const Payment(),
                  //     isScrollControlled: true, isDismissible: false);
                },
              ),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}
