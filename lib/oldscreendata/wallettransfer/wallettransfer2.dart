import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/selectplatform.dart';

class WalletTransfer2 extends StatelessWidget {
  final RxInt step;
  const WalletTransfer2({super.key, required this.step});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration:
                BoxDecoration(color: const Color(0xff596EB6).withOpacity(0.11)),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 25),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xff232D51),
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
                              color: Color(0xfff6f6f6),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account No.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff9E9A9A),
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '23481010181',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff232D51),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff9E9A9A),
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Avis Charles A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff232D51),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 100,
                    )
                  ],
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Beneficial Platform',
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
              Get.dialog(const SelectPlatform());
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
                    Get.dialog(const SelectPlatform());
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
                'Enter Transaction PIN',
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
              hintText: 'PIN',
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
              buttonText: 'Authorize',
              onTap: () {
                step.value = 3;
              },
            ),
          )
        ],
      ),
    );
  }
}
