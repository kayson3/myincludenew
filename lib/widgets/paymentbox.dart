import 'package:flutter/material.dart';

Widget box(
    {required String img,
    required String title,
    required String subtitle,
    Color? boxColor,
    void Function()? onTap,
    Color? textColor,
    Widget? icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 93,
      width: 73,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          img.isEmpty
              ? icon ?? const SizedBox(
                      height: 30,
                      width: 30,
                    )
              : Image.asset(img, height: 32, width: 35, fit: BoxFit.fill),
          const SizedBox(
            height: 5,
          ),
          Text(title,
              // textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? const Color(0xfff6f6f6))),
          const SizedBox(
            height: 5,
          ),
          Text(subtitle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? const Color(0xfff6f6f6))),
        ],
      ),
    ),
  );
}
