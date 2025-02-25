import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/dialog.dart';
import 'package:includenew/widgets/inputfield.dart';

class Data2 extends StatelessWidget {
  final RxInt step;
  const Data2({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: const Color(0xffffffff),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Transaction Pin',
            style: TextStyle(
                color: Color(0xff343131),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Enter your transaction pin to complete this bank transfer',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff344054),
                fontSize: 11,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 25,
          ),
          TextInputField(),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text(
          //       'Didn’t receive the code? ',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Color(0xff344054), //344054
          //           fontSize: 11,
          //           fontWeight: FontWeight.w400),
          //     ),
          //     const Text(
          //       ' Resend again',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Color(0xff344054),
          //           fontSize: 11,
          //           fontWeight: FontWeight.w700),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 40,
          ),
          Button(
            buttonWidth: 124,
            buttonText: 'Submit',
            onTap: () {
              Get.dialog(SuccessfulDialogs(
                showloader: false,
                showclose: true,
                title: 'Success',
                description: 'Subscription is being processed',
              ));
            },
          )
        ]),
      ),
    );
  }
}
