import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/button.dart';

class WalletTransfer4 extends StatelessWidget {
  final RxInt step;
  const WalletTransfer4({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Successful',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff343131),
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          const SizedBox(
            // width: ,
            height: 10,
          ),
          const Text(
            'Your Transfer is being processed',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff344054),
                fontWeight: FontWeight.w500,
                fontSize: 10.8),
          ),
          const SizedBox(
            // width: ,
            height: 30,
          ),
          Button(
            buttonWidth: 124,
            buttonText: 'Close',
            color: const Color(0xff0B112F),
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
