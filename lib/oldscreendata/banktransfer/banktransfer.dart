import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/oldscreendata/banktransfer/banktransfer1.dart';
import 'package:includenew/oldscreendata/banktransfer/banktransfer2.dart';
import 'package:includenew/oldscreendata/banktransfer/banktransfer3.dart';

class BankTransfer extends StatelessWidget {
  RxInt step = 1.obs;
  BankTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Constants.bgSecColor(),
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20)), // Customizing the container
      ),
      height: 655,
      child: Obx(
        () => Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 68,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Constants.bgColor(),
            decoration: BoxDecoration(
                color: Constants.bgSecColor(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.4),
                  topRight: Radius.circular(12.4),
                )),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (step.value == 1) {
                      Get.back();
                    } else {
                      step.value -= 1;
                    }
                  },
                  child: Icon(
                    Ionicons.arrow_back_circle_outline,
                    color: Constants.btnColor(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text('Bank Transfer',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Ionicons.ios_close_circle_outline,
                    color: Constants.btnColor(),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   // width: 250,
          //   height: 10,
          // ),
          if (step.value == 1) BankTransfer1(step: step),
          if (step.value == 2) BankTransfer2(step: step),
          if (step.value == 3) BankTransfer3(step: step),

          // const SizedBox(
          //   // width: 250,
          //   height: 10,
          // ),
          // const Text(
          //   'Powered by',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       color: Color(0xff9F9F9F),
          //       fontWeight: FontWeight.w500,
          //       fontSize: 10.8),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //         padding: const EdgeInsets.only(top: 4, bottom: 4),
          //         height: 25.4,
          //         width: 25.4,
          //         decoration: BoxDecoration(
          //             color: const Color(0xff232D51),
          //             borderRadius: BorderRadius.circular(3.09)),
          //         child: Image.asset(
          //           'assets/images/finswich.png',
          //           width: 13.6,
          //           height: 17,
          //         )),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     const Text(
          //       'Fin',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Color(0xff232D51),
          //           fontWeight: FontWeight.w400,
          //           fontSize: 13),
          //     ),
          //     const Text(
          //       'Swich',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Color(0xff232D51),
          //           fontWeight: FontWeight.w700,
          //           fontSize: 13),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   // width: 50000,
          //   height: 15,
          // ),
        ]),
      ),
    );
  }
}
