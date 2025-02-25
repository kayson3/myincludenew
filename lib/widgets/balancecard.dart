import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BalanceCard extends StatelessWidget {
  final String name;
  final String amount;
  final Color color;

  const BalanceCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 165,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  FontAwesome5Solid.wallet,
                  color: Color(0xff1E3F52),
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E3F52),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1E3F52),
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
