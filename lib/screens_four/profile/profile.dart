import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/screens/profile/help.dart';
import 'package:includenew/screens/profile/loginandsecurity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants.dart';
import '../auth/login.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key}) {
    if (Constants.store.read("googleAuth") != null) {
      google2fa.value = Constants.store.read("googleAuth");
    }
  }

  RxBool kycdone = false.obs;
  RxBool isLoading = false.obs;

  RxBool google2fa = false.obs;

  final authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    if (Constants.store.read("KYCDATA")['status'] == "verified") {
      kycdone.value = true;
    }
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: isLoading.value,
        child: Scaffold(
          backgroundColor: Constants.bgColor(),
          body: SafeArea(
            left: false,
            right: false,
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 25,
                ),
                Icon(
                  MaterialCommunityIcons.account_circle,
                  color: Constants.txtColor(),
                  size: 70,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])} ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['lastname'])}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w800,
                          fontSize: 20)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "@${Constants.store.read("LOGININFO")['user']['phone'].toString().substring(4)}",
                  style: TextStyle(
                      color: Constants.txtSecColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    Constants.storeDesign.read("ACCOUNTDESIGN")['app'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 40,
                    //         width: 40,
                    //         padding: const EdgeInsets.all(10),
                    //         decoration: const BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Color(0xffE6E7EB),
                    //         ),
                    //         child: Image.asset(
                    //           'assets/images/2fact.png',
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               '2 Factor Authentication',
                    //               style: TextStyle(
                    //                   color: Constants.txtSecColor(),
                    //                   fontWeight: FontWeight.w700,
                    //                   fontSize: 15),
                    //             ),
                    //             const Text(
                    //               'Get Confirmation Code in google auth app for all transactions',
                    //               style: TextStyle(
                    //                   color: Color(0xff8B8B8B),
                    //                   fontWeight: FontWeight.w400,
                    //                   fontSize: 12),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       Transform.scale(
                    //         scale: 0.6,
                    //         child: CupertinoSwitch(
                    //             thumbColor: Constants.btnColor(),
                    //             trackColor: const Color(0xffD9D9D9),
                    //             value: google2fa.value,
                    //             onChanged: (v) {
                    //               isLoading.value = true;
                    //               if (v) {
                    //                 authController.start2fa().then((value) {
                    //                   isLoading.value = false;
                    //                   if (value) {
                    //                     Get.bottomSheet(GFAuth(val: v),
                    //                             isScrollControlled: true,
                    //                             isDismissible: false)
                    //                         .then(
                    //                             (value) => google2fa.value = v);
                    //                   }
                    //                   return null;
                    //                 });
                    //               } else {
                    //                 isLoading.value = false;
                    //                 google2fa.value = v;
                    //               }
                    //             }),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.bottomSheet(Security(), isScrollControlled: true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE6E7EB),
                              ),
                              child: Image.asset(
                                'assets/images/unlocked.png',
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Login & Security',
                                    style: TextStyle(
                                        color: Constants.txtSecColor(),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  const Text(
                                    'Reset your login Password',
                                    style: TextStyle(
                                        color: Color(0xff8B8B8B),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Visibility(
                              visible: false,
                              child: Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                    thumbColor: const Color(0xff232D51),
                                    trackColor: const Color(0xffD9D9D9),
                                    value: false,
                                    onChanged: (v) {}),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Constants.txtColor()!.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(
                          () => Help(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE6E7EB),
                              ),
                              child: Image.asset(
                                'assets/images/help.png',
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Help & Support',
                                    style: TextStyle(
                                        color: Constants.txtSecColor(),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  const Text(
                                    'Need help? Talk to our support center',
                                    style: TextStyle(
                                        color: Color(0xff8B8B8B),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Visibility(
                              visible: false,
                              child: Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                    thumbColor: const Color(0xff232D51),
                                    trackColor: const Color(0xffD9D9D9),
                                    value: false,
                                    onChanged: (v) {}),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        isLoading.value = true;
                        authController.logout().then((value) async {
                          isLoading.value = false;
                          // if (value) {
                          await Constants.store.erase();
                          Get.offAll(Login());
                          // } else {}
                          return null;
                        });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          decoration: BoxDecoration(
                              color: Constants.btnColor(),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                AntDesign.logout,
                                color: Constants.btnSecColor(),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'LOGOUT',
                                style: TextStyle(
                                    color: Constants.btnSecColor(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
