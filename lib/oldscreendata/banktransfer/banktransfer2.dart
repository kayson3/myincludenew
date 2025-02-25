import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

class BankTransfer2 extends StatelessWidget {
  final RxInt step;
  const BankTransfer2({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: Constants.bgSecColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            'Transaction Pin',
            style: TextStyle(
                color: Constants.txtColor(),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Enter your transaction pin to complete this bank transfer',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.txtSecColor(),
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
            color: Constants.btnColor(),
            textColor: Constants.btnSecColor(),
            onTap: () {
              step.value = 3;
            },
          )
        ]),
      ),
    );
  }
}
