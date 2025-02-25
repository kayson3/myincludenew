import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

class WalletTransfer3 extends StatelessWidget {
  final RxInt step;
  const WalletTransfer3({super.key, required this.step});

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
            'Verification Code',
            style: TextStyle(
                color: Color(0xff343131),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'We have sent the verification code to your email address',
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Didn’t receive the code? ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff344054), //344054
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                ' Resend again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff344054),
                    fontSize: 11,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Button(
            buttonWidth: 124,
            buttonText: 'Submit',
            onTap: () {
              step.value = 4;
            },
          )
        ]),
      ),
    );
  }
}
