import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens/auth/applock.dart';

// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widgets/button.dart';

class FacialC extends StatelessWidget {
  const FacialC({super.key});

  // RxBool obscurePassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: whiteColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      body: SafeArea(
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Stack(
                    children: [
                      Center(
                          child: Image.asset(
                        'assets/images/authcard.png',
                        height: 184,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      )),
                      Positioned(
                          bottom: 90,
                          left: 70,
                          child: Text(
                            'Facial Capture',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          )),
                      Positioned(
                          bottom: 50,
                          left: 70,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 90,
                            child: Text(
                              'Click button at the middle to capture your face to proceed.',
                              style: TextStyle(
                                  color: Constants.txtSecColor(),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/face.png',
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Button(
                    buttonText: 'Get Started',
                    buttonWidth: 134,
                    onTap: () {
                      Get.to(() => AppLock());
                    },
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(() => AppLock());
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    // Get.to(() => SignUp());
                  },
                  child: Container(
                    width: 74,
                    height: 74,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //     color: const Color(0xfff6f6f6), width: 2)
                    ),
                    child: const Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
