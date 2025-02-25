import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';

class FundWallet1 extends StatelessWidget {
  final RxInt step;

  const FundWallet1({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter Amount',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          const SizedBox(
            // width: ,
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, right: 25),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xffEDF1F6),
                borderRadius: BorderRadius.circular(11.4),
                border: Border.all(color: const Color(0xffBBCFE8)),
              ),
              child: Row(
                children: [
                  const Text(
                    '₦',
                    style: TextStyle(
                        color: Color(0xff888EA1),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: '0.0',
                      style: const TextStyle(
                          color: Color(0xff232D51),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            // width: ,
            height: 30,
          ),
          Button(
            buttonWidth: 181,
            buttonText: 'Fund',
            color: Constants.btnColor(),
            onTap: () {
              step.value = 2;
            },
          )
        ],
      ),
    );
  }
}
