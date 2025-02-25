import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/colors.dart';
import 'package:includenew/oldscreendata/giftcard/giftcard1.dart';

class GiftCard extends StatelessWidget {
  RxInt step = 1.obs;
  GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 68,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Color(0xff232D51),
                borderRadius: BorderRadius.only(
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
                  child: const Icon(
                    Ionicons.arrow_back_circle_outline,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Gift Card',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Ionicons.ios_close_circle_outline,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   // width: 250,
          //   height: 10,
          // ),
          if (step.value == 1) GiftCard1(step: step),
          // if (step.value == 2) Subscription2(step: step),
          // if (step.value == 3) BankTransfer3(step: step),

          const SizedBox(
            // width: 250,
            height: 10,
          ),
          const Text(
            'Powered by',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff9F9F9F),
                fontWeight: FontWeight.w500,
                fontSize: 10.8),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  height: 25.4,
                  width: 25.4,
                  decoration: BoxDecoration(
                      color: const Color(0xff232D51),
                      borderRadius: BorderRadius.circular(3.09)),
                  child: Image.asset(
                    'assets/images/finswich.png',
                    width: 13.6,
                    height: 17,
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Fin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff232D51),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              const Text(
                'Swich',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff232D51),
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(
            // width: 50000,
            height: 15,
          ),
        ]),
      ),
    );
  }
}
