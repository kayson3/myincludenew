import 'package:flutter/material.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/maintenance.gif'),
            const Text(
              "Intrapay is currently down for maintenance",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              "We expect to be back in a couple of hours. Thanks for your",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ], //0A254E
          //44CF95
        ),
      ),
    );
  }
}
