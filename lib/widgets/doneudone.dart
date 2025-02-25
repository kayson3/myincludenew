import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';

class DoneUndoneButton extends StatelessWidget {
  Function()? onTap;
  DoneUndoneButton({super.key, required this.done, this.onTap});

  final RxBool done;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => done.value = true,
      child: Obx(
        () => Container(
          height: 18.2,
          width: 75,
          decoration: BoxDecoration(
            // color: done.value? Color(0xfff6f6f6),//232D51
            borderRadius: BorderRadius.circular(4.6),
            gradient: done.value
                ? const LinearGradient(colors: [
                    Color(0xff429846),
                    Color(0xff419D45),
                    Color(0xff48C14D),
                    Color(0xff31D738),
                    Color(0xff31D738),
                    Color(0xff2EE136),
                  ])
                : LinearGradient(colors: [
                    Constants.btnColor(),
                    Constants.btnColor(),
                  ]),
          ),
          child: Center(
            child: Text(
              done.value ? 'Done' : 'Get Started',
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff6f6f6)),
            ),
          ),
        ),
      ),
    );
  }
}
