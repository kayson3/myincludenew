import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

class Subscription4 extends StatelessWidget {
  final RxInt step;
  const Subscription4({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),

          const Center(
            child: Text(
              'Pay with  Phone number',
              style: TextStyle(
                  color: Color(0xff343131),
                  fontWeight: FontWeight.w700,
                  fontSize: 18.6),
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
                'Phone number',
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
              hintText: '0**********23',
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
                'Platform to Debit',
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

          // const SizedBox(
          //   height: 20,
          // ),

          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Text(
                  'Didn’t receive the code?  ',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff090914),
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                ),
                Text(
                  'Resend again',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff090914),
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Button(
              buttonWidth: 124,
              // color: Constants.btnColor(),
              buttonText: 'Submit',
              onTap: () {
                step.value = 5;
              },
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 25),
            height: 100,
            decoration: const BoxDecoration(color: Color(0xffF2F5FE)),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Click “Subscription Services

                    Text(
                      '1.  Go to your platform & open the FinSwich',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff344054),
                          fontWeight: FontWeight.w400,
                          fontSize: 9),
                    ), //
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2.  Click “Subscription Services',
                      style: TextStyle(
                          color: Color(0xff344054),
                          fontWeight: FontWeight.w400,
                          fontSize: 9),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3.  Search for Netflix and turn it on',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff344054),
                          fontWeight: FontWeight.w400,
                          fontSize: 9),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color(0xff0B112F), shape: BoxShape.circle),
                      child: const Text(
                        '1',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w700,
                            fontSize: 11),
                      ),
                    ),
                    SubBox(
                      icon: FontAwesome5Brands.amazon,
                      iconcolor: const Color(0xffFBA525),
                      boxtext: 'Amazon',
                      ison: false.obs,
                    ),
                  ],
                ),

                const SizedBox(
                  width: 10,
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color(0xff0B112F), shape: BoxShape.circle),
                      child: const Text(
                        '2',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w700,
                            fontSize: 11),
                      ),
                    ),
                    SubBox(
                      icon: FontAwesome5Brands.amazon,
                      iconcolor: const Color(0xffFBA525),
                      boxtext: 'Amazon',
                      ison: true.obs,
                    ),
                  ],
                ),
                // Transform.scale(
                //   scale: 0.2,
                //   child: SubBox(
                //     icon: FontAwesome5Brands.amazon,
                //     iconcolor: Color(0xffFBA525),
                //     boxtext: 'Amazon',
                //     ison: true.obs,
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SubBox extends StatelessWidget {
  Color? color;
  Color? iconcolor;
  String? boxtext;
  RxBool? ison;
  IconData? icon;
  SubBox(
      {super.key,
      this.color,
      this.boxtext,
      this.iconcolor,
      this.ison,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      padding: const EdgeInsets.only(
        left: 9,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.7),
        color: color ?? const Color(0xdffedf1f6),
      ),
      child: Stack(
        // alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Icon(
                icon,
                size: 13,
                color: iconcolor ?? const Color(0xdffedf1f6),
              ),
              const SizedBox(height: 4),
              Text(
                boxtext ?? '',
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 5.28,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Obx(
              () => Transform.scale(
                // scale: 0.9,
                scaleY: 0.2,
                scaleX: 0.2,
                child: CupertinoSwitch(
                    thumbColor: ison!.value
                        ? const Color(0xff0075E2)
                        : const Color(0xff645E5E),
                    trackColor: const Color(0xffD9D9D9),
                    activeColor: const Color(0xffD9D9D9),
                    value: ison!.value,
                    onChanged: (v) {
                      ison!.value = v;
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
