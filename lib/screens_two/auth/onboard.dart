import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';

import 'login.dart';

// import 'package:includenew/screens_two/login.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});

  final RxInt currentIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    List bckendonboardingdata = Constants.storeDesign
                .read("ACCOUNTDESIGN")['design']
                .containsKey("onboarding") &&
            Constants.storeDesign
                .read("ACCOUNTDESIGN")['design']['onboarding']
                .isNotEmpty
        ? Constants.storeDesign.read("ACCOUNTDESIGN")['design']['onboarding']
        : [
            {
              "title": "Access Financial Services",
              "subTitle":
                  "Sign up your account for free, get access to different financial services",
              "primary_color": "#232D51",
              "secondary_color": "#ffffff",
              "card_image":
                  "https://include-design-image.s3.amazonaws.com/include_onboarding_default_screen_1.png"
            },
            {
              "title": "Transfer to anywhere in the world",
              "subTitle":
                  "Sign up your account for free, get access to different financial services",
              "primary_color": "#232D51",
              "secondary_color": "#ffffff",
              "card_image":
                  "https://include-design-image.s3.amazonaws.com/include_onboarding_default_screen_2.png"
            },
            {
              "title": "Pay for utilities",
              "subTitle":
                  "Sign up your account for free,get access to different financial services",
              "primary_color": "#232D51",
              "secondary_color": "#ffffff",
              "card_image":
                  "https//include-design-image.s3.amazonaws.com/include_onboarding_default_screen_3.png"
            }
          ];
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(currentIndex.value == 1
                          ? bckendonboardingdata[0]['card_image']
                          : currentIndex.value == 2
                              ? bckendonboardingdata[1]['card_image']
                              : bckendonboardingdata[2]['card_image']),
                      fit: BoxFit.fitWidth)),
              child: Container(
                width: MediaQuery.sizeOf(context).width - 30,
                margin: const EdgeInsets.only(bottom: 15),
                height: MediaQuery.sizeOf(context).height / 2.5,
                decoration: ShapeDecoration(
                  color: Constants.bgColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Text(
                      currentIndex.value == 1
                          ? bckendonboardingdata[0]['title']
                          : currentIndex.value == 2
                              ? bckendonboardingdata[1]['title']
                              : bckendonboardingdata[2]['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.12,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 40,
                      child: Text(
                        currentIndex.value == 1
                            ? bckendonboardingdata[0]['subTitle']
                            : currentIndex.value == 2
                                ? bckendonboardingdata[1]['subTitle']
                                : bckendonboardingdata[2]['subTitle'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtSecColor(),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: _buildIndicator(),
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleButton(
                          color: Constants.btnColor(),
                          onTap: () {
                            if (currentIndex.value < 3) {
                              currentIndex.value++;
                            } else {
                              Get.to(() => Login());
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex.value < 3) {
                              currentIndex.value++;
                            } else {
                              Get.to(() => Login());
                            }
                          },
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              backgroundColor: Colors.grey,
                              value: (currentIndex.value / 3),
                              color: Constants.btnColor(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Login());
                },
                child: Text(
                  'Skip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.txtSecColor(),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 16 : 10,
      margin: const EdgeInsets.only(bottom: 5, right: 5),
      decoration: isActive
          ? BoxDecoration(
              color: Constants.btnColor(),
              borderRadius: BorderRadius.circular(4))
          : BoxDecoration(
              color: const Color(0xffB8B8B8),
              borderRadius: BorderRadius.circular(4)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 1; i < 4; i++) {
      if (currentIndex.value == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  // Container(      Image.asset('assets/images/onboardingtemptwo/three.png'),
  //           height: 92,
  //           width: double.infinity,
  //           margin: const EdgeInsets.symmetric(horizontal: 25),
  //           decoration: BoxDecoration(
  //               // color: Colors.amber,
  //               color: Constants.cardbgColor(),
  //               borderRadius: BorderRadius.circular(30)),
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: Constants.storeDesign
  //                         .read("ACCOUNTDESIGN")['design']['card_image']
  //                         .toString()
  //                         .isEmpty
  //                     ? const AssetImage('assets/images/authcard.png')
  //                     : NetworkImage(
  //                         Constants.store.read("ACCOUNTDESIGN")['design']
  //                             ['card_image']) as ImageProvider<Object>,
  //                 fit: BoxFit.fill,
  //                 opacity: 0.8,
  //               ),
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //             child: Center(
  //               child: GestureDetector(
  //                 onTap: () {
  //                   if (currentIndex.value == 2) {
  //                     Get.to(() => Login());
  //                   } else {
  //                     pageController.nextPage(
  //                       duration: const Duration(milliseconds: 500),
  //                       curve: Curves.easeIn,
  //                     );
  //                   }
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.symmetric(horizontal: 25),
  //                   height: 50,
  //                   width: 240,
  //                   decoration: BoxDecoration(
  //                       color: Constants.bgColor(),
  //                       borderRadius: BorderRadius.circular(6.4),
  //                       border: Border.all(color: Constants.btnColor())),
  //                   child: Obx(
  //                     () => Center(
  //                       child: Text(
  //                         currentIndex.value == 2 ? 'Get Started' : 'Next',
  //                         style: TextStyle(
  //                             color: Constants.txtColor(),
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.w600),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
}
