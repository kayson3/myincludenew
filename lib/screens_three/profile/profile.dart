import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/screens/profile/help.dart';
import 'package:includenew/screens/profile/loginandsecurity.dart';
import 'package:includenew/screens_three/profile/gfauth.dart';
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
          backgroundColor: Constants.bgSecColor(),
          body: SafeArea(
            left: false,
            right: false,
            bottom: true,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 137,
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 35),
                      decoration: ShapeDecoration(
                        color: Constants.bgColor(),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Constants.txtColor()!,
                            blurRadius: 3,
                            offset: const Offset(0, 5),
                            spreadRadius: -2,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  // Constants.appAlias(),
                                  "${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])} ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['lastname'])}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Constants.txtSecColor(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  Constants.store.read("LOGININFO")['user']
                                      ['phone'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.50,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          ClipOval(
                            // radius: 25,
                            child: Constants.applogo().isEmpty
                                ? Image.asset(
                                    'assets/images/ico.png',
                                    height: 48,
                                    width: 48,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    Constants.applogo(),
                                    height: 48,
                                    width: 48,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //           'Customer ID : ' +
                    //               Constants.store.read('LOGININFO')['user']
                    //                   ['_id'],
                    //           // textAlign: TextAlign.center,
                    //           style: const TextStyle(
                    //               color: Color(0xff86849B),
                    //               fontWeight: FontWeight.w700,
                    //               fontSize: 12)),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     // GestureDetector(
                    //     //   onTap: () {
                    //     //     isLoading.value = true;
                    //     //     authController.logout().then((value) {
                    //     //       isLoading.value = false;
                    //     //       // if (value) {
                    //     //       Constants.store.erase();
                    //     //       Get.offAll(Login());
                    //     //       // } else {}
                    //     //       return null;
                    //     //     });
                    //     //   },
                    //     //   child: const Icon(
                    //     //     AntDesign.logout,
                    //     //     color: Color(0xffBF2F2F),
                    //     //     size: 18,
                    //     //   ),
                    //     // ),
                    //     // const SizedBox(
                    //     //   width: 5,
                    //     // ),
                    //     // GestureDetector(
                    //     //   onTap: () {
                    //     //     isLoading.value = true;
                    //     //     authController.logout().then((value) {
                    //     //       isLoading.value = false;
                    //     //       // if (value) {
                    //     //       Constants.store.erase();
                    //     //       Get.offAll(Login());
                    //     //       // } else {}
                    //     //       return null;
                    //     //     });
                    //     //   },
                    //     //   child: const Text('Logout',
                    //     //       // textAlign: TextAlign.center,
                    //     //       style: TextStyle(
                    //     //           color: Color(0xff86849B),
                    //     //           fontWeight: FontWeight.w700,
                    //     //           fontSize: 11)),
                    //     // ),
                    //   ],
                    // ),

                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'FinSwich Number',
                                    style: TextStyle(
                                        color: Constants.txtSecColor(),
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
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Platform',
                                    style: TextStyle(
                                        color: Constants.txtSecColor(),
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
                      height: 35,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            height: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Constants.cardbgColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  // padding: const EdgeInsets.all(7),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Constants.bgColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    shadows: [
                                      BoxShadow(
                                        color: Constants.bgSecColor(),
                                        blurRadius: 2,
                                        offset: const Offset(2, 2),
                                        spreadRadius: -1,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.person,
                                      color: Constants.txtSecColor(),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Customer ID',
                                  style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      // 'MD2347',
                                      '${Constants.store.read('LOGININFO')['user']['_id'].toString().substring(0, 4)}...',
                                      style: TextStyle(
                                        color: Constants.cardTextColor(),
                                        fontSize: 10,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                        height: 0.17,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                            text: Constants.store
                                                    .read('LOGININFO')['user']
                                                ['_id']));

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
                                        width: 45,
                                        height: 20,
                                        // padding: const EdgeInsets.all(8.11),
                                        decoration: ShapeDecoration(
                                          color: Constants.bgColor(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.56),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'copy',
                                            style: TextStyle(
                                              color: Constants.txtSecColor(),
                                              fontSize: 12,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // GestureDetector(
                          //   behavior: HitTestBehavior.opaque,
                          //   onTap: () {
                          //     if (Constants.store.read("KYCSUBMITTED") ==
                          //         true) {
                          //       Get.bottomSheet(const KycEmailSubmitted());
                          //     } else {
                          //       Get.bottomSheet(KYC(), isScrollControlled: true)
                          //           .then((value) {
                          //         // return kycdone.value = true;
                          //       });
                          //     }
                          //   },
                          //   child: Container(
                          //     width: MediaQuery.sizeOf(context).width / 2.5,
                          //     height: 125,
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 15, vertical: 10),
                          //     decoration: ShapeDecoration(
                          //       color: Constants.cardbgColor(),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(7)),
                          //     ),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Container(
                          //               width: 32,
                          //               height: 32,
                          //               // padding: const EdgeInsets.all(7),
                          //               clipBehavior: Clip.antiAlias,
                          //               decoration: ShapeDecoration(
                          //                 color: Constants.bgColor(),
                          //                 shape: RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(4)),
                          //                 shadows: [
                          //                   BoxShadow(
                          //                     color: Constants.bgSecColor(),
                          //                     blurRadius: 2,
                          //                     offset: const Offset(2, 2),
                          //                     spreadRadius: -1,
                          //                   )
                          //                 ],
                          //               ),
                          //               child: Center(
                          //                 child: Icon(
                          //                   Icons.info_outline,
                          //                   color: Constants.txtSecColor(),
                          //                 ),
                          //               ),
                          //             ),
                          //             const Spacer(),
                          //             Icon(
                          //               Icons.arrow_forward_ios_outlined,
                          //               color: Constants.cardTextColor(),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'KYC',
                          //               style: TextStyle(
                          //                 color: Constants.txtColor(),
                          //                 fontSize: 14,
                          //                 fontFamily: 'Manrope',
                          //                 fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //             const Spacer(),
                          //             Obx(
                          //               () => Visibility(
                          //                   visible: kycdone.value,
                          //                   child: DoneUndoneButton(
                          //                       done: kycdone)),
                          //             ),
                          //           ],
                          //         ),
                          //         Text(
                          //           'Increase your transaction limit by completing your KYC',
                          //           style: TextStyle(
                          //             color: Constants.cardTextColor(),
                          //             fontSize: 10,
                          //             fontFamily: 'Manrope',
                          //             fontWeight: FontWeight.w400,
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            height: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Constants.cardbgColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      // padding: const EdgeInsets.all(7),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Constants.bgColor(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        shadows: [
                                          BoxShadow(
                                            color: Constants.bgSecColor(),
                                            blurRadius: 2,
                                            offset: const Offset(2, 2),
                                            spreadRadius: -1,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Ionicons.key_outline,
                                          color: Constants.txtSecColor(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: CupertinoSwitch(
                                          thumbColor: Constants.btnColor(),
                                          trackColor: const Color(0xffD9D9D9),
                                          value: google2fa.value,
                                          onChanged: (v) {
                                            isLoading.value = true;
                                            if (v) {
                                              authController
                                                  .start2fa()
                                                  .then((value) {
                                                isLoading.value = false;
                                                if (value) {
                                                  Get.bottomSheet(
                                                          GFAuth(val: v),
                                                          isScrollControlled:
                                                              true,
                                                          isDismissible: false)
                                                      .then((value) =>
                                                          google2fa.value = v);
                                                }
                                                return null;
                                              });
                                            } else {
                                              isLoading.value = false;
                                              google2fa.value = v;
                                            }
                                          }),
                                    )
                                  ],
                                ),
                                Text(
                                  '2FA Authentication',
                                  style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Get Confirmation Code in your email for all transactions',
                                  style: TextStyle(
                                    color: Constants.cardTextColor(),
                                    fontSize: 10,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.bottomSheet(Security(),
                                  isScrollControlled: true);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 2.5,
                              height: 125,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        // padding: const EdgeInsets.all(7),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Constants.bgColor(),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          shadows: [
                                            BoxShadow(
                                              color: Constants.bgSecColor(),
                                              blurRadius: 2,
                                              offset: const Offset(2, 2),
                                              spreadRadius: -1,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Ionicons.lock_open,
                                            color: Constants.txtSecColor(),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Constants.cardTextColor(),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Login & Security',
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Reset your login Password',
                                    style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontSize: 10,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            height: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Constants.cardbgColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      // padding: const EdgeInsets.all(7),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Constants.bgColor(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        shadows: [
                                          BoxShadow(
                                            color: Constants.bgSecColor(),
                                            blurRadius: 2,
                                            offset: const Offset(2, 2),
                                            spreadRadius: -1,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MaterialIcons.fingerprint,
                                          color: Constants.txtSecColor(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: CupertinoSwitch(
                                          thumbColor: Constants.btnColor(),
                                          trackColor: const Color(0xffD9D9D9),
                                          value: false,
                                          onChanged: (v) {}),
                                    )
                                  ],
                                ),
                                Text(
                                  'Biometric',
                                  style: TextStyle(
                                    color: Constants.txtColor(),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Turn on your phone biometric',
                                  style: TextStyle(
                                    color: Constants.cardTextColor(),
                                    fontSize: 10,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.to(
                                () => Help(),
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 2.5,
                              height: 125,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        // padding: const EdgeInsets.all(7),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Constants.bgColor(),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          shadows: [
                                            BoxShadow(
                                              color: Constants.bgSecColor(),
                                              blurRadius: 2,
                                              offset: const Offset(2, 2),
                                              spreadRadius: -1,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Feather.phone_call,
                                            color: Constants.txtSecColor(),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Constants.cardTextColor(),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Help & Support',
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 14,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Need help? Talk to our support center',
                                    style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontSize: 10,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 100,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 70),
                  child: GestureDetector(
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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constants.btnSecColor(),
                              ),
                              child: const Icon(
                                AntDesign.logout,
                                color: Color(0xffBF2F2F),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Constants.txtSecColor(),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 15,
                          // ),
                          // Visibility(
                          //   visible: false,
                          //   child: Transform.scale(
                          //     scale: 0.6,
                          //     child: CupertinoSwitch(
                          //         thumbColor: const Color(0xff232D51),
                          //         trackColor: const Color(0xffD9D9D9),
                          //         value: false,
                          //         onChanged: (v) {}),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.btnColor(),
                            ),
                            child: Icon(
                              Icons.home_outlined,
                              color: Constants.btnSecColor(),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Constants.txtSecColor(),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
