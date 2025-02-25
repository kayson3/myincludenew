import 'package:flutter/material.dart';

class SubTab extends StatelessWidget {
  Color? color;
  Color? tabtextcolor;
  String? tabtext;
  SubTab({super.key, this.color, this.tabtext, this.tabtextcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.7),
        color: color ?? const Color(0xdffddeeff),
      ),
      child: Text(
        tabtext ?? '',
        style: TextStyle(
            color: tabtextcolor ?? const Color(0xdff232d51),
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
