import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/subbox.dart';
import 'package:includenew/widgets/subtab..dart';

class GiftCard1 extends StatelessWidget {
  final RxInt step;
  const GiftCard1({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      color: const Color(0xffffffff),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            // Row(
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         step.value = 1;
            //       },
            //       child: SubTab(
            //         tabtext: 'My Subscription',
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // step.value = 2;
            //       },
            //       child: SubTab(
            //         tabtext: 'All Services',
            //         color: Color(0xff232D51),
            //         tabtextcolor: Color(0xfff6f6f6),
            //       ),
            //     )
            //   ],
            // ),

            // const SizedBox(
            //   height: 20,
            // ),

            SizedBox(
              height: 36,
              child: TextInputField(
                  borderColor: const Color(0xffCBD5E1),
                  radius: 24,
                  isdense: true,
                  filledColor: const Color(0xffF8FAFC),
                  hintText: 'Search Ebay, Apple, Amazon etc',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffCBD5E1),
                  ),
                  contentPadding: EdgeInsets.zero),
            ),

            const SizedBox(
              height: 20,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      step.value = 1;
                    },
                    child: SubTab(
                      tabtext: 'Nigeria',
                      color: const Color(0xff232D51),
                      tabtextcolor: const Color(0xfff6f6f6),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // step.value = 2;
                    },
                    child: SubTab(
                      tabtext: 'UK',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // step.value = 2;
                    },
                    child: SubTab(
                      tabtext: 'USA',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // step.value = 2;
                    },
                    child: SubTab(
                      tabtext: 'Canada',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // step.value = 2;
                    },
                    child: SubTab(
                      tabtext: 'UAE',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubBox(
                  icon: FontAwesome5Brands.xbox,
                  iconcolor: const Color(0xff545454),
                  boxtext: 'XBox',
                  ison: true.obs,
                ),
                SubBox(
                  icon: FontAwesome5Brands.ebay,
                  iconcolor: const Color(0xff545454),
                  boxtext: 'Ebay',
                  ison: true.obs,
                ),
                SubBox(
                  icon: FontAwesome5Brands.spotify,
                  iconcolor: const Color(0xff1ED760),
                  boxtext: 'Spotify',
                  ison: true.obs,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubBox(
                  icon: FontAwesome5Brands.google_play,
                  iconcolor: const Color(0xff545454),
                  boxtext: 'Google Play',
                  ison: true.obs,
                ),
                SubBox(
                  icon: FontAwesome5Brands.amazon,
                  iconcolor: const Color(0xffFBA525),
                  boxtext: 'Amazon',
                  ison: true.obs,
                ),
                SubBox(
                  icon: FontAwesome5Brands.apple,
                  iconcolor: const Color(0xff545454),
                  boxtext: 'iTunes US',
                  ison: true.obs,
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25, right: 25),
            //   child: Button(
            //     buttonWidth: 182,
            //     color: Constants.btnColor(),
            //     buttonText: 'Verify',
            //     onTap: () {
            //       step.value = 2;
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
