import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../widgets/button.dart';

class WalletTransfer1 extends StatelessWidget {
  final RxInt step;
  const WalletTransfer1({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Wallet ID',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff090914),
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextInputField(
              borderColor: const Color(0xffCBD5E1),
              radius: 8.2,
              filledColor: const Color(0xffF8FAFC),
              hintText: 'Enter Wallet Number',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Narration',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff090914),
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextInputField(
              borderColor: const Color(0xffCBD5E1),
              radius: 8.2,
              filledColor: const Color(0xffF8FAFC),
              hintText: 'Reason for sending money',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Button(
              buttonWidth: 182,
              color: Constants.btnColor(),
              buttonText: 'Verify',
              onTap: () {
                step.value = 2;
              },
            ),
          )
        ],
      ),
    );
  }
}
