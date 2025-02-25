import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/login.dart';

// import 'package:includenew/screens/login.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});

  final RxInt currentIndex = 0.obs;
  final pageController = PageController();

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
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    PageView(
                      scrollDirection: Axis.vertical,
                      controller: pageController,
                      onPageChanged: (i) {
                        currentIndex.value = i;
                      },
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    bckendonboardingdata[0]['card_image']
                                                .runtimeType ==
                                            String
                                        ? bckendonboardingdata[0]['card_image']
                                            .toString()
                                        : bckendonboardingdata[0]['card_image']
                                                [0]
                                            .toString(),
                                  ),
                                  fit: BoxFit.fitWidth)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bckendonboardingdata[0]['title'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[0]
                                                      ['primary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  bckendonboardingdata[0]['subTitle'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[0]
                                                      ['secondary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    bckendonboardingdata[1]['card_image']
                                        .toString(),
                                  ),
                                  fit: BoxFit.fitWidth)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bckendonboardingdata[1]['title'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[1]
                                                      ['primary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  bckendonboardingdata[1]['subTitle'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[1]
                                                      ['secondary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    bckendonboardingdata[2]['card_image']
                                        .toString(),
                                  ),
                                  fit: BoxFit.fitWidth)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bckendonboardingdata[2]['title'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[2]
                                                      ['primary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  bckendonboardingdata[2]['subTitle'],
                                  style: TextStyle(
                                      color: Color(int.parse(
                                          Constants.replaceFirstChar(
                                              bckendonboardingdata[2]
                                                      ['secondary_color']
                                                  .toString(),
                                              "0xff"))),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 30,
                      right:
                          -20, //defaultTargetPlatform == TargetPlatform.iOS ? 18 : 13,
                      child: Obx(
                        () => Column(
                          children: [
                            //FontAwesome5_Solid.long_arrow_alt_right

                            ..._buildIndicator(),
                            const SizedBox(
                              height: 30,
                            ),
                            Transform.rotate(
                              angle: 11,
                              child: Text(
                                'SWIPE UP',
                                style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Icon(
                              FontAwesome5Solid.long_arrow_alt_up,
                              color: Constants.btnColor(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
            Positioned(
              bottom: -95,
              child: Container(
                height:
                    184, //This value is gotten from the given height and width from the figma given value
                width: MediaQuery.sizeOf(context).width - 60,
                // width: 343,
                // height: 115,

                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    color: Constants.cardbgColor(),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      image: Constants.cardImage().isEmpty
                          ? const DecorationImage(
                              image: AssetImage('assets/images/authcard.png'),
                              fit: BoxFit.fill,
                              opacity: 0.8,
                            )
                          : DecorationImage(
                              image: NetworkImage(Constants.cardImage()),
                              fit: BoxFit.fill,
                              opacity: 0.8,
                            ),
                      borderRadius: BorderRadius.circular(30)),
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
                      width: 240,
                      decoration: BoxDecoration(
                          color: Constants.btnColor(),
                          borderRadius: BorderRadius.circular(6.4),
                          border: Border.all(color: Constants.btnColor())),
                      child: Obx(
                        () => Center(
                          child: Text(
                            currentIndex.value == 2 ? 'Get Started' : 'Next',
                            style: TextStyle(
                                // color:
                                color: Constants.btnSecColor(),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 6,
      height: isActive ? 24.78 : 13.04,
      margin: const EdgeInsets.only(bottom: 5),
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
