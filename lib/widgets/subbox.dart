import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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
      height: 105,
      width: 95,
      padding: const EdgeInsets.only(left: 15, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.7),
        color: color ?? const Color(0xdffedf1f6),
      ),
      child: Stack(
        children: [
          Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Icon(
                icon,
                size: 23,
                color: iconcolor ?? const Color(0xdffedf1f6),
              ),
              const SizedBox(height: 20),
              Text(
                boxtext ?? '',
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Obx(
              () => Transform.scale(
                // scale: 0.9,
                scaleY: 0.5,
                scaleX: 0.6,
                child: CupertinoSwitch(
                    thumbColor: const Color(0xff0075E2),
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
