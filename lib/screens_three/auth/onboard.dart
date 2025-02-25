import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_three/auth/login.dart';

// import 'package:includenew/screens/login.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});

  final RxInt currentIndex = 0.obs;
  final pageController = PageController();
  final secondPageController = PageController();

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      secondPageController
          .jumpTo(pageController.page! * MediaQuery.of(context).size.width);
    });

    return Scaffold(
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Obx(
          () {
            currentIndex.value;
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Include',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.txtColor(),
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    height: 0.05,
                    letterSpacing: -0.50,
                  ),
                ),
                const Spacer(),
                SizedBox(
                    height: 341,
                    child: Obx(
                      () {
                        currentIndex.value;
                        return PageView(
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          onPageChanged: (i) {
                            currentIndex.value = i;
                          },
                          children: [
                            SizedBox(
                              height: 341,
                              // MediaQuery.sizeOf(context).width +
                              //     (MediaQuery.sizeOf(context).width / 2),
                              width: MediaQuery.sizeOf(context).width,
                              child: Image.asset(
                                'assets/images/temp_three/currency_crush_graphs.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 341,
                              // MediaQuery.sizeOf(context).width +
                              //     (MediaQuery.sizeOf(context).width / 2),
                              width: MediaQuery.sizeOf(context).width,
                              child: Image.asset(
                                'assets/images/temp_three/currency_crush_mobile_oney.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 341,
                              // MediaQuery.sizeOf(context).width +
                              //     (MediaQuery.sizeOf(context).width / 2),
                              width: MediaQuery.sizeOf(context).width,
                              child: Image.asset(
                                'assets/images/temp_three/currency_crush_password.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      },
                    )),
                const SizedBox(
                  height: 24,
                ),

                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._buildIndicator(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: 150,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: secondPageController,
                    onPageChanged: (i) {
                      currentIndex.value = i;
                      pageController.jumpTo(secondPageController.page! *
                          MediaQuery.of(context).size.width);
                    },
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Access Financial\nServices',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 24,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.50,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Sign up your account for free, get access to different financial services',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pay For Utilities',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 24,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.50,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Sign up your account for free, get access to different financial services',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Access Financial\nServices',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 24,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.50,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Sign up your account for free, get access to different financial services',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex.value == 2) {
                        Get.to(() => Login());
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      width: MediaQuery.sizeOf(context).width - 40,
                      decoration: BoxDecoration(
                        color: Constants.btnColor(),
                        borderRadius: BorderRadius.circular(6.4),
                        // border: Border.all(color: Constants.btnColor())
                      ),
                      child: Obx(
                        () => Center(
                          child: Text(
                            currentIndex.value == 2 ? 'Get Started' : 'Next',
                            style: TextStyle(
                                color: Constants.btnSecColor(),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 92,
                //   width: double.infinity,
                //   margin: const EdgeInsets.symmetric(horizontal: 25),
                //   decoration: BoxDecoration(
                //       // color: Colors.amber,
                //       color: Constants.cardbgColor(),
                //       borderRadius: BorderRadius.circular(30)),
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: Constants.storeDesign
                //                 .read("ACCOUNTDESIGN")['design']['card_image']
                //                 .toString()
                //                 .isEmpty
                //             ? const AssetImage('assets/images/authcard.png')
                //             : NetworkImage(
                //                 Constants.store.read("ACCOUNTDESIGN")['design']
                //                     ['card_image']) as ImageProvider<Object>,
                //         fit: BoxFit.fill,
                //         opacity: 0.8,
                //       ),
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     child: Center(
                //       child: GestureDetector(
                //         onTap: () {
                //           if (currentIndex.value == 2) {
                //             Get.to(() => Login());
                //           } else {
                //             pageController.nextPage(
                //               duration: const Duration(milliseconds: 500),
                //               curve: Curves.easeIn,
                //             );
                //           }
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(horizontal: 25),
                //           height: 50,
                //           width: 240,
                //           decoration: BoxDecoration(
                //               color: Constants.bgColor(),
                //               borderRadius: BorderRadius.circular(6.4),
                //               border: Border.all(color: Constants.btnColor())),
                //           child: Obx(
                //             () => Center(
                //               child: Text(
                //                 currentIndex.value == 2 ? 'Get Started' : 'Next',
                //                 style: TextStyle(
                //                     color: Constants.btnColor(),
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Stack(
                //   alignment: AlignmentDirectional.center,
                //   children: [
                //     Image.asset('assets/images/getstartedcard.png'),
                //     GestureDetector(
                //       onTap: () {
                //         if (currentIndex.value == 2) {
                //           Get.to(() => Login());
                //         } else {
                //           pageController.nextPage(
                //             duration: const Duration(milliseconds: 500),
                //             curve: Curves.easeIn,
                //           );
                //         }
                //       },
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(horizontal: 25),
                //         height: 50,
                //         width: 240,
                //         decoration: BoxDecoration(
                //           color: Constants.btnColor(),
                //           borderRadius: BorderRadius.circular(6.4),
                //         ),
                //         child: Obx(
                //           () => Center(
                //             child: Text(
                //               currentIndex.value == 2 ? 'Get Started' : 'Next',
                //               style: const TextStyle(
                //                   color: whiteColor,
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w600),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 16 : 10,
      height: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: isActive
          ? BoxDecoration(
              color: Constants.btnColor(),
              borderRadius: BorderRadius.circular(4))
          : BoxDecoration(
              color: const Color(0xFFDADADA),
              borderRadius: BorderRadius.circular(4)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex.value == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
