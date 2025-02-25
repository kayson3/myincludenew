import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/models/banklist.dart';

class SelectPlatform extends StatelessWidget {
  const SelectPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffEDEFF7),
            borderRadius: BorderRadius.circular(12.4)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Text('Select Platforms',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff232D51),
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Ionicons.ios_close_circle_outline,
                    color: Color(0xff232D51),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: RawScrollbar(
                  thumbColor: const Color(0xff232D51),
                  // isAlwaysShown: true,
                  // minThumbLength: 0.1,
                  thickness: 6,
                  radius: const Radius.circular(6),
                  // trackVisibility: true,
                  child: ListView(
                    children: bankList
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, bottom: 25.0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      e.img,
                                      height: 29,
                                      width: 29,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(e.name,
                                            // textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Color(0xff232D51),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16)),
                                        Text(e.description,
                                            // textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Color(0xff9E9A9A),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
