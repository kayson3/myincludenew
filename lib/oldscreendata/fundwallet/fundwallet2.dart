import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/state_manager.dart';
import 'package:includenew/colors.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';

class FundWallet2 extends StatelessWidget {
  RxInt step;
  FundWallet2({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.copy,
                  color: darkColor,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Copy',
                  style: TextStyle(fontSize: 10, color: Color(0xff232D51)),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 82,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 25, left: 25),
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
              decoration: BoxDecoration(
                  color: const Color(0xffEDF1F6),
                  borderRadius: BorderRadius.circular(10.8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 41,
                    width: 41,
                    // padding: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Color(0xff33426F), shape: BoxShape.circle),
                    child: const Icon(
                      MaterialCommunityIcons.bank,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Wema Bank',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff777777))),
                        SizedBox(
                          height: 3,
                        ),
                        Text('01145274781', //
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4D5667))),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Jubril Abdullahi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff777777))),
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Amount to fund',
                  style: TextStyle(fontSize: 9, color: Color(0xff777777)),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('₦ 1,000', //
                    style: TextStyle(
                        fontSize: 14.3,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff232D51))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: const Color(0xffABABAB),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.2)),
                  child: Container(
                    height: 76,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffF8FAFC),
                    ),
                    child: const Center(
                      child: Text('Upload Payment Evidence', //
                          style: TextStyle(
                              fontSize: 11.3,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777))),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
              color: Constants.btnColor(),
              buttonText: 'I have a Paid',
              onTap: () {
                step.value = 3;
              },
            ),
          ],
        ));
  }
}
