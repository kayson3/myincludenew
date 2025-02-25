import 'package:flutter/material.dart';

class TransTab extends StatelessWidget {
  final bool? selected;
  final bool grey;
  final String? text;
  final Function()? onTap;
  const TransTab(
      {Key? key, this.selected, this.text, this.onTap, this.grey = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: grey
                ? const Color(0xff9699Ce)
                : selected!
                    ? const Color(0xff040869)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: grey
                ? Border.all(width: 0, color: const Color(0xff9699Ce))
                : selected!
                    ? Border.all(width: 0)
                    : Border.all(color: const Color(0xff040869))),
        child: Text(text!,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: grey
                    ? Colors.white
                    : selected!
                        ? const Color(0xfff6f6f6)
                        : const Color(0xff040869))),
      ),
    );
  }
}
