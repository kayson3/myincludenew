import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/selectplatform.dart';

class BankTransfer1 extends StatelessWidget {
  final RxInt step;
  const BankTransfer1({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      color: Constants.bgSecColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Select Country',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Constants.txtColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // Get.dialog(const SelectPlatform());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextInputField(
                  readonly: true,
                  borderColor: Constants.txtColor(),
                  radius: 8.2,
                  filledColor: Constants.bgSecColor(),
                  hintText: 'Select Country',
                  onTap: () {
                    // Get.dialog(const SelectPlatform());
                  },
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Constants.txtSecColor(),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Bank Name',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Constants.txtColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // Get.dialog(const SelectPlatform());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextInputField(
                  readonly: true,
                  borderColor: Constants.txtColor(),
                  radius: 8.2,
                  filledColor: Constants.bgSecColor(),
                  hintText: 'Enter bank name',
                  onTap: () {
                    Get.dialog(const SelectPlatform());
                  },
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Constants.txtSecColor(),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Account Number',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Constants.txtColor(),
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
              borderColor: Constants.txtColor(),
              radius: 8.2,
              filledColor: Constants.bgSecColor(),
              hintText: 'Enter Amount',
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Amount',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Constants.txtColor(),
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
              borderColor: Constants.txtColor(),
              radius: 8.2,
              filledColor: Constants.bgSecColor(),
              hintText: 'Enter Amount',
              keyboardType: TextInputType.phone,
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Button(
              buttonWidth: 182,
              color: Constants.btnColor(),
              textColor: Constants.btnSecColor(),
              buttonText: 'Continue',
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
