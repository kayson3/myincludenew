import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';

class BankTransfer3 extends StatelessWidget {
  final RxInt step;
  const BankTransfer3({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Successful',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.txtColor(),
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          const SizedBox(
            // width: ,
            height: 10,
          ),
          Text(
            'Your Transfer is being processed',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.txtSecColor(),
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
            color: Constants.btnColor(),
            textColor: Constants.btnSecColor(),
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
