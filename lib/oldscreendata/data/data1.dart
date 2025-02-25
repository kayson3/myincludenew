import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

class Data1 extends StatelessWidget {
  final RxInt step;
  const Data1({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      color: const Color(0xffffffff),
      child: SingleChildScrollView(
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
                  'Select Country',
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
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // Get.dialog(const SelectPlatform());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextInputField(
                    readonly: true,
                    borderColor: const Color(0xffCBD5E1),
                    radius: 8.2,
                    filledColor: const Color(0xffF8FAFC),
                    hintText: 'Select Country',
                    onTap: () {
                      // Get.dialog(const SelectPlatform());
                    },
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xff6F6F6F),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Phone Number',
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
                hintText: '+14363728234',
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Service Provider',
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
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // Get.dialog(const SelectPlatform());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextInputField(
                    readonly: true,
                    borderColor: const Color(0xffCBD5E1),
                    radius: 8.2,
                    filledColor: const Color(0xffF8FAFC),
                    hintText: 'Select',
                    onTap: () {
                      // Get.dialog(const SelectPlatform());
                    },
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xff6F6F6F),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Service Plan',
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
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // Get.dialog(const SelectPlatform());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextInputField(
                    readonly: true,
                    borderColor: const Color(0xffCBD5E1),
                    radius: 8.2,
                    filledColor: const Color(0xffF8FAFC),
                    hintText: 'Select',
                    onTap: () {
                      // Get.dialog(const SelectPlatform());
                    },
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xff6F6F6F),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Amount',
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
                hintText: 'Enter Amount',
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
                buttonText: 'Continue',
                onTap: () {
                  step.value = 2;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
