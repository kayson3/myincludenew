import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';

class Subscription3 extends StatelessWidget {
  final RxInt step;
  const Subscription3({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 475,
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                height: 105,
                width: 95,
                padding: const EdgeInsets.only(left: 15, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.7),
                  color: const Color(0xdffedf1f6),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset('assets/images/clipart.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Flexflix',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Button(
                      height: 30,
                      buttonWidth: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      color: const Color(0xffC02424),
                      buttonText: 'Revoke',
                      textSize: 11.35,
                      onTap: () {
                        step.value = 4;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Permanently disable Netflix from any debit attempt.',
                      style: TextStyle(
                          color: Color(0xff344054),
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Allow debit once',
                  style: TextStyle(
                      color: const Color(0xff344054).withOpacity(0.33),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Spacer(),
              Transform.scale(
                // scale: 0.9,
                scaleY: 0.5,
                scaleX: 0.6,
                child: CupertinoSwitch(
                    thumbColor: const Color(0xff645E5E).withOpacity(0.28),
                    trackColor: const Color(0xffD9D9D9).withOpacity(0.28),
                    activeColor: const Color(0xffD9D9D9).withOpacity(0.28),
                    value: false,
                    onChanged: (v) {
                      // ison!.value = v;
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Netflix will only be able to debit this your wallet once; after which you will need to turn this on again.',
            style: TextStyle(
                color: const Color(0xff344054).withOpacity(0.33),
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Allow debit always',
                  style: TextStyle(
                      color: Color(0xff344054),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Spacer(),
              Transform.scale(
                // scale: 0.9,
                scaleY: 0.5,
                scaleX: 0.6,
                child: CupertinoSwitch(
                    thumbColor: const Color(0xff0075E2),
                    trackColor: const Color(0xffD9D9D9),
                    activeColor: const Color(0xffD9D9D9),
                    value: true,
                    onChanged: (v) {
                      // ison!.value = v;
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Netflix will only be able to debit this your wallet once; after which you will need to turn this on again.',
            style: TextStyle(
                color: Color(0xff344054),
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 35,
          ),
          Button(
            buttonWidth: 150,
            // color: Constants.btnColor(),
            buttonText: 'Save & Submit',
            onTap: () {
              step.value = 4;
            },
          )
        ],
      ),
    );
  }
}
