import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/dialog.dart';
import 'package:includenew/widgets/inputfield.dart';

class FundSavings extends StatelessWidget {
  const FundSavings({super.key});

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
                'Amount to fund',
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
              hintText: 'Enter amount',
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
                r'Wallet balance: $30,000.00',
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
          // const Padding(
          //   padding: EdgeInsets.only(left: 25, right: 25),
          //   child: TextInputField(
          //     borderColor: Color(0xffCBD5E1),
          //     radius: 8.2,
          //     filledColor: Color(0xffF8FAFC),
          //     hintText: 'Reason for sending money',
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Button(
              buttonWidth: 124,
              // color: Constants.btnColor(),
              buttonText: 'Submit',
              onTap: () {
                Get.dialog(SuccessfulDialogs(
                  showloader: false,
                  showclose: true,
                  title: 'Success',
                  description: 'Funding request is being processed',
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
