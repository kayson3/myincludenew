import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_four/auth/login.dart';
import 'package:includenew/screens_four/auth/signup.dart';

import '../../widgets/button.dart';

// import 'package:includenew/screens/login.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});

  final RxInt currentIndex = 0.obs;
  final pageController = PageController();
  final secondPageController = PageController();

  @override
  Widget build(BuildContext context) {
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
                  height: 50,
                ),

                const SizedBox(
                  height: 25,
                ),

                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    onPageChanged: (i) {
                      currentIndex.value = i;
                      // pageController.jumpTo(secondPageController.page! *
                      //     MediaQuery.of(context).size.width);
                    },
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 197,
                            width: 265,
                            child: Image.asset(
                              'assets/images/temp_four/1temp4onboard.png',
                              fit: BoxFit.fill,
                              width: 265,
                              height: 197,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Virtual Cards',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.btnColor(),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Pay\nEverywhere',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 30,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'our virtual cards gives you ability\nto pay online across multiple\nplatform seamlessly.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontSize: 18,
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
                          SizedBox(
                            height: 205,
                            width: 265,
                            child: Image.asset(
                              'assets/images/temp_four/2temp4onboard.png',
                              fit: BoxFit.fill,
                              width: 265,
                              height: 205,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Send Money',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.btnColor(),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Send\nAnywhere',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 30,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Send money to friends, family\nand business partners globally.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontSize: 18,
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
                          SizedBox(
                            width: 249,
                            height: 205,
                            child: Image.asset(
                              'assets/images/temp_four/1temp4onboard-1.png',
                              fit: BoxFit.fill,
                              width: 249,
                              height: 205,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Utilities',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.btnColor(),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Pay &\nsubscribe\nutilities',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 30,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Pay for Airtime, data, power,\ntransport, insurance all in one\napp.',
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

                // const Spacer(),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        buttonWidth: 124,
                        height: 43,
                        buttonText: "Login",
                        textSize: 14,
                        radius: 22,
                        onTap: () {
                          Get.to(() => Login());
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Button(
                        buttonWidth: 124,
                        height: 43,
                        buttonText: "Register",
                        textSize: 14,
                        radius: 22,
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                if (currentIndex.value != 2)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(
                            () => Center(
                              child: Text(
                                currentIndex.value == 2
                                    ? 'Get Started'
                                    : 'Next',
                                style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Constants.txtColor(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
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
