import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/screens_two/profile/help.dart';
import 'package:includenew/screens_two/profile/loginandsecurity.dart';
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
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: 0,
                  child: SizedBox(
                      height: 184,
                      width: MediaQuery.sizeOf(context).width / 2,
                      // margin: const EdgeInsets.symmetric(horizontal: 25),

                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Constants.cardbgColor()!, BlendMode.srcATop),
                            image: Constants.cardImage().toString().isEmpty
                                ? const AssetImage(
                                    'assets/images/cardtemp2.png')
                                : NetworkImage(Constants.cardImage())
                                    as ImageProvider<Object>,
                            fit: BoxFit.fill,
                            opacity: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )),
                ),
                Positioned(
                  top: -50,
                  right: 0,
                  child: SizedBox(
                      height: 184,
                      width: MediaQuery.sizeOf(context).width / 2,
                      // margin: const EdgeInsets.symmetric(horizontal: 25),

                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Constants.cardbgColor()!, BlendMode.srcATop),
                            image: Constants.cardImage().toString().isEmpty
                                ? const AssetImage(
                                    'assets/images/cardtemp2.png')
                                : NetworkImage(Constants.cardImage())
                                    as ImageProvider<Object>,
                            fit: BoxFit.fill,
                            opacity: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )),
                ),
                Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 287,
                    child: Text(
                      'My account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontSize: 25,
                        fontFamily: 'e-Ukraine',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/user.png',
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(25)),
                    // child: Image.asset(
                    //   'assets/images/oshapi1.png',
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                        "${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])} ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['lastname'])}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //       Constants.store.read("LOGININFO")['user']['phone'],
                  //       // textAlign: TextAlign.center,
                  //       style: const TextStyle(
                  //           color: Color(0xff86849B),
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 12)),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: ShapeDecoration(
                      color: Constants.bgSecColor(),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    child: ListView(
                      children: [
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(horizontal: 20.0),
                        //     child: Text(
                        //       'Personal info',
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //         color: Constants.txtColor(),
                        //         fontSize: 12,
                        //         fontFamily: 'Manrope',
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // width: MediaQuery.of(context).size.width - 90,
                                      child: Text(
                                        'FinSwich Number',
                                        style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      Constants.store
                                          .read("LOGININFO")['user']['phone']
                                          .toString()
                                          .substring(4),
                                      style: TextStyle(
                                          color: Constants.txtSecColor(),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22),
                                    ),
                                  ]),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Platform',
                                        style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Constants.storeDesign
                                            .read("ACCOUNTDESIGN")['app'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Constants.txtSecColor(),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xffE6E7EB),
                                ),
                                child: Image.asset(
                                  'assets/images/imageid.png',
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
                                      'Customer ID',
                                      style: TextStyle(
                                          color: Constants.txtColor(),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      Constants.store.read('LOGININFO')['user']
                                          ['_id'],
                                      style: TextStyle(
                                          color: Constants.txtSecColor(),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: Constants.store
                                          .read('LOGININFO')['user']['_id']));

                                  Fluttertoast.showToast(
                                      msg: "Copied!!",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      // backgroundColor: Colors.red,
                                      // textColor: Colors.white,
                                      fontSize: 14.0);
                                },
                                child: Container(
                                  height: 31.2,
                                  width: 79,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD8D8D8), //232D51
                                    borderRadius: BorderRadius.circular(4.6),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'copy',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF848282),
                                        fontSize: 13,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        // letterSpacing: -0.10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // Obx(
                        //   () => GestureDetector(
                        //     behavior: HitTestBehavior.opaque,
                        //     onTap: () {
                        //       if (Constants.store.read("KYCSUBMITTED") ==
                        //           true) {
                        //         Get.bottomSheet(const KycEmailSubmitted());
                        //       } else {
                        //         Get.bottomSheet(KYC(), isScrollControlled: true)
                        //             .then((value) {
                        //           // return kycdone.value = true;
                        //         });
                        //       }
                        //     },
                        //     child: Padding(
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 25.0),
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             height: 40,
                        //             width: 40,
                        //             padding: const EdgeInsets.all(10),
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(4),
                        //               color: const Color(0xffE6E7EB),
                        //             ),
                        //             child: Image.asset(
                        //               'assets/images/kyc2.png',
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 15,
                        //           ),
                        //           Expanded(
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(
                        //                   'KYC',
                        //                   style: TextStyle(
                        //                       color: Constants.txtColor(),
                        //                       fontWeight: FontWeight.w700,
                        //                       fontSize: 15),
                        //                 ),
                        //                 Text(
                        //                   'Increase your transaction limit by completing your KYC',
                        //                   style: TextStyle(
                        //                       color: Constants.txtSecColor(),
                        //                       fontWeight: FontWeight.w400,
                        //                       fontSize: 12),
                        //                 ),
                        //                 Visibility(
                        //                     visible: kycdone.value,
                        //                     child: DoneUndoneButton(
                        //                         done: kycdone)),
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 20,
                        //           ),
                        //           Icon(
                        //             Icons.arrow_forward_ios_rounded,
                        //             color: Constants.txtColor(),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 25,
                        // ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.bottomSheet(Security(),
                                isScrollControlled: true);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xffE6E7EB),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Login & Security',
                                        style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Reset your login Password',
                                        style: TextStyle(
                                            color: Constants.txtSecColor(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Constants.txtColor(),
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         height: 40,
                        //         width: 40,
                        //         padding: const EdgeInsets.all(10),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(4),
                        //           color: const Color(0xffE6E7EB),
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
                        //                   color: Constants.txtColor(),
                        //                   fontWeight: FontWeight.w700,
                        //                   fontSize: 15),
                        //             ),
                        //             Text(
                        //               'Get Confirmation Code in google auth app for all transactions',
                        //               style: TextStyle(
                        //                   color: Constants.txtSecColor(),
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
                        //                         .then((value) =>
                        //                             google2fa.value = v);
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
                            Get.to(
                              () => Help(),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xffE6E7EB),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Help & Support',
                                        style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Need help? Talk to our support center',
                                        style: TextStyle(
                                            color: Constants.txtSecColor(),
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
                          height: 25,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )),
                ]),
                Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Constants.btnColor(),
                      ),
                    )),
                Positioned(
                  bottom: 25,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      children: [
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                                  child: const Icon(
                                    AntDesign.logout,
                                    color: Color(0xffBF2F2F),
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
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
                        const Spacer(),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.back();
                        //   },
                        //   child: Container(
                        //     width: 128,
                        //     height: 40,
                        //     padding: const EdgeInsets.all(6),
                        //     decoration: ShapeDecoration(
                        //       color: Constants.btnColor(),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(6)),
                        //     ),
                        //     child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           ColorFiltered(
                        //               colorFilter: const ColorFilter.matrix([
                        //                 -1,
                        //                 0,
                        //                 0,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 -1,
                        //                 0,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 0,
                        //                 -1,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 0,
                        //                 0,
                        //                 1,
                        //                 0,
                        //               ]),
                        //               child: Icon(
                        //                 Icons.home_outlined,
                        //                 color: Constants.bgColor(),
                        //               )),
                        //           ColorFiltered(
                        //             colorFilter: const ColorFilter.matrix([
                        //               -1,
                        //               0,
                        //               0,
                        //               0,
                        //               255,
                        //               0,
                        //               -1,
                        //               0,
                        //               0,
                        //               255,
                        //               0,
                        //               0,
                        //               -1,
                        //               0,
                        //               255,
                        //               0,
                        //               0,
                        //               0,
                        //               1,
                        //               0,
                        //             ]),
                        //             child: Text(
                        //               'Home',
                        //               style: TextStyle(
                        //                 color: Constants.bgColor(),
                        //                 fontSize: 12,
                        //                 fontFamily: 'Manrope',
                        //                 fontWeight: FontWeight.w600,
                        //               ),
                        //             ),
                        //           ),
                        //           ColorFiltered(
                        //               colorFilter: const ColorFilter.matrix([
                        //                 -1,
                        //                 0,
                        //                 0,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 -1,
                        //                 0,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 0,
                        //                 -1,
                        //                 0,
                        //                 255,
                        //                 0,
                        //                 0,
                        //                 0,
                        //                 1,
                        //                 0,
                        //               ]),
                        //               child: Icon(
                        //                 Icons.arrow_forward,
                        //                 color: Constants.bgColor(),
                        //               )),
                        //         ]),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
