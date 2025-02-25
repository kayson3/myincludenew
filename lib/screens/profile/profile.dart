import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Column(children: [
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
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])} ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['lastname'])}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Constants.txtSecColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 25)),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          Constants.store.read("LOGININFO")['user']['phone'],
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xff86849B),
                              fontWeight: FontWeight.w700,
                              fontSize: 12)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        height: 150,
                        width: double.infinity,
                        // margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            color: Constants.cardbgColor(),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Constants.cardImage().isEmpty
                                  ? const AssetImage(
                                      'assets/images/authcard.png')
                                  : NetworkImage(Constants.cardImage())
                                      as ImageProvider<Object>,
                              fit: BoxFit.fill,
                              opacity: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    // child: Image.asset(
                                    //   'assets/images/oshapi1.png',
                                    // ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            // width: MediaQuery.of(context).size.width - 90,
                                            child: Text(
                                              'FinSwich Number',
                                              style: TextStyle(
                                                  color:
                                                      Constants.cardTextColor(),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            Constants.store
                                                .read("LOGININFO")['user']
                                                    ['phone']
                                                .toString()
                                                .substring(4),
                                            style: TextStyle(
                                                color:
                                                    Constants.cardTextColor(),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Platform',
                                            style: TextStyle(
                                                color:
                                                    Constants.cardTextColor(),
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
                                                color:
                                                    Constants.cardTextColor(),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        child: ListView(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
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
                                          color: Constants.txtSecColor(),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      Constants.store.read('LOGININFO')['user']
                                          ['_id'],
                                      style: const TextStyle(
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
                        // const SizedBox(
                        //   height: 25,
                        // ),
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
                        //           const EdgeInsets.symmetric(horizontal: 15.0),
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             height: 40,
                        //             width: 40,
                        //             padding: const EdgeInsets.all(10),
                        //             decoration: const BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Color(0xffE6E7EB),
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
                        //                       color: Constants.txtSecColor(),
                        //                       fontWeight: FontWeight.w700,
                        //                       fontSize: 15),
                        //                 ),
                        //                 const Text(
                        //                   'Increase your transaction limit by completing your KYC',
                        //                   style: TextStyle(
                        //                       color: Color(0xff8B8B8B),
                        //                       fontWeight: FontWeight.w400,
                        //                       fontSize: 12),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 20,
                        //           ),
                        //           Visibility(
                        //               visible: kycdone.value,
                        //               child: DoneUndoneButton(done: kycdone)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.bottomSheet(Security(),
                                isScrollControlled: true);
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
                                        inactiveTrackColor:
                                            const Color(0xffD9D9D9),
                                        value: false,
                                        onChanged: (v) {}),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 25,
                        // ),
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
                        //         child: const Stack(
                        //           alignment: AlignmentDirectional.center,
                        //           children: [
                        //             Icon(
                        //               MaterialIcons.fingerprint,
                        //               size: 20,
                        //               color: Colors.blueAccent,
                        //             ),
                        //             Icon(
                        //               MaterialCommunityIcons.scan_helper,
                        //               size: 21,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 15,
                        //       ),
                        //       const Expanded(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               'Biometric',
                        //               style: TextStyle(
                        //                   color: Constants.txtSecColor(),
                        //                   fontWeight: FontWeight.w700,
                        //                   fontSize: 15),
                        //             ),
                        //             Text(
                        //               'Turn on your phone biometric',
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
                        //             thumbColor: const Color(0xff232D51),
                        //             trackColor: const Color(0xffD9D9D9),
                        //             value: false,
                        //             onChanged: (v) {}),
                        //       )
                        //     ],
                        //   ),
                        // ),
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
                                        inactiveTrackColor:
                                            const Color(0xffD9D9D9),
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                            color: Constants.txtSecColor(),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                      const Text(
                                        'Logout of your current session',
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
                                        inactiveTrackColor:
                                            const Color(0xffD9D9D9),
                                        value: false,
                                        onChanged: (v) {}),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.btnColor(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Constants.btnSecColor(),
                            ),
                          )
                          // Image.asset(
                          //   'assets/images/home.png',
                          //   color: Constants.btnSecColor(),
                          // ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
