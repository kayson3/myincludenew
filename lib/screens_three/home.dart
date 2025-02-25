// import 'package:badges/badges.dart';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/kyc.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/finswich/nativeiframe.dart';
import 'package:includenew/models/trsansactions.dart';
import 'package:includenew/oldscreendata/accountrestrictedmodal.dart';
// import 'package:includenew/screens/banktransfer/banktransfer.dart';
import 'package:includenew/screens_three/alltransactions.dart';
// import 'package:includenew/screens/finswich/inlinecheckouttest.dart';
import 'package:includenew/screens_three/profile/profile.dart';
import 'package:info_popup/info_popup.dart';
import 'package:intl/intl.dart';

import '../apis/userwallet.dart';
import '../oldscreendata/banktransfer/banktransfer.dart';
import '../trasaction_details.dart';

class Home extends StatelessWidget {
  final controller = Get.put(UserWallet());
  Home({
    super.key,
  }) {
    controller.allTransaction();
  }

  RxBool ischeckoutVisible = false.obs;

  final kyccontroller = Get.put(KycAPI());

  //Savings deposit
  // Payment ID: 12484jejsdjsismw9

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
          left: false,
          right: false,
          top: true,
          child: Obx(
            () => Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Obx(
                  () => Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 137,
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 35),
                        decoration: ShapeDecoration(
                          color: Constants.bgSecColor(),
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
                            GestureDetector(
                              onTap: () {
                                // controller.getUserWallet();
                                Get.to(() => Profile());
                                // Constants.logger.d(Constants.store.read("LOGININFO")['user']);
                              },
                              child: ClipOval(
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
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    // Constants.appAlias(),
                                    "Hi ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])},",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Constants.txtSecColor(),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22),
                                  ),
                                  Text(
                                    'Welcome back!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 16,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.50,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Badge(
                                label: const Text(
                                  '1',
                                  style: TextStyle(
                                      color: Color(0xfff6f6f6),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                child: Icon(
                                  Ionicons.ios_notifications,
                                  color: Constants.txtSecColor(),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        // height: 135.83,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 21),
                        decoration: ShapeDecoration(
                          color: Constants.cardbgColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
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
                            Container(
                              width: 94.54,
                              height: 93.83,
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  NumberFormat.simpleCurrency(
                                              name: Constants.store.read(
                                                  "USERWALLET")['currency'])
                                          .currencySymbol +
                                      Constants.moneyFormat(double.parse(
                                          Constants.store
                                              .read("USERWALLET")['balance']
                                              .toString())),
                                  style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${NumberFormat.simpleCurrency(name: 'NGN').currencySymbol} 0.00",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Constants.cardTextColor(),
                                        fontSize: 13,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InfoPopupWidget(
                                      contentTitle:
                                          'This is a floating balance based on the current rate of your local currency to USD. Therefore, this amount may change from time to time based on current rate. Your true balance is in dollars',
                                      child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Constants.btnColor(),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Entypo.info,
                                            color: Constants.btnSecColor(),
                                            size: 7,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Stack(
                      //   alignment: AlignmentDirectional.bottomCenter,
                      //   children: [
                      //     Center(
                      //         child: Image.asset(
                      //       'assets/images/authcard.png',
                      //       height: 184,
                      //       width: double.infinity,
                      //       fit: BoxFit.fill,
                      //     )),
                      //     const Positioned(
                      //         bottom: 120,
                      //         // left: 70,
                      //         child: SizedBox(
                      //           // width: MediaQuery.of(context).size.width - 90,
                      //           child: Text(
                      //             'Wallet Balance',
                      //             style: TextStyle(
                      //                 color: Constants.txtSecColor(),
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 14),
                      //           ),
                      //         )),
                      //     const Positioned(
                      //         bottom: 80,
                      //         // left: 70,
                      //         child: Text(
                      //           '₦100,340.00',
                      //           style: TextStyle(
                      //               color: Constants.txtSecColor(),
                      //               fontWeight: FontWeight.w700,
                      //               fontSize: 25),
                      //         )),
                      //     Positioned(
                      //         bottom: 20,
                      //         // left: 70,
                      //         child: Row(
                      //           children: [
                      //             GestureDetector(
                      //               onTap: () {
                      //                 Get.dialog(
                      //                   FundWallet(),
                      //                   barrierDismissible: false,
                      //                 );
                      //               },
                      //               child: Container(
                      //                 width: 70,
                      //                 padding:
                      //                     const EdgeInsets.symmetric(vertical: 12),
                      //                 decoration: BoxDecoration(
                      //                     color: const Color(0xff0B112F),
                      //                     borderRadius: BorderRadius.circular(6.4)),
                      //                 child: const Center(
                      //                   child: Text(
                      //                     'Fund',
                      //                     style: TextStyle(
                      //                         color: whiteColor,
                      //                         fontWeight: FontWeight.w600,
                      //                         fontSize: 11.5),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(width: 10),
                      //             GestureDetector(
                      //               onTap: () {
                      //                 Get.dialog(
                      //                   BankTransfer(),
                      //                   barrierDismissible: false,
                      //                 );
                      //               },
                      //               child: Container(
                      //                 width: 70,
                      //                 padding:
                      //                     const EdgeInsets.symmetric(vertical: 12),
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.transparent,
                      //                     border: Border.all(
                      //                         color: const Color(0xff000000)),
                      //                     borderRadius: BorderRadius.circular(6.4)),
                      //                 child: const Center(
                      //                   child: Text(
                      //                     'Withdraw',
                      //                     style: TextStyle(
                      //                         color: Color(0xff000000),
                      //                         fontWeight: FontWeight.w600,
                      //                         fontSize: 11.5),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         )),
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.dialog(
                              //   FundWallet(),
                              //   barrierDismissible: false,
                              // );

                              ischeckoutVisible.value = true;
                            },
                            child: Container(
                              width: 94.87,
                              height: 132.97,
                              padding: const EdgeInsets.all(17.09),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.69,
                                    height: 60.69,
                                    decoration: ShapeDecoration(
                                      color: Constants.bgColor(),
                                      shape: const OvalBorder(),
                                    ),
                                    child: Icon(
                                      Ionicons.md_card,
                                      color: Constants
                                          .txtSecColor(), //FontAwesome.send
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Fund',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontSize: 15.38,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.43,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                BankTransfer(),
                                isScrollControlled: true,
                              );
                            },
                            child: Container(
                              width: 94.87,
                              height: 132.97,
                              padding: const EdgeInsets.all(17.09),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.69,
                                    height: 60.69,
                                    decoration: ShapeDecoration(
                                      color: Constants.bgColor(),
                                      shape: const OvalBorder(),
                                    ),
                                    child: Transform.flip(
                                      flipY: true,
                                      flipX: true,
                                      child: Icon(
                                        FontAwesome.send,
                                        color: Constants.txtSecColor(), //
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Withdraw',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontSize: 12.38,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.43,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Constants.store
                                      .read("KYCDATA")['status']
                                      .toString() ==
                                  "verified") {
                                // Get.bottomSheet(InlineCheckout(),
                                //     isScrollControlled: true,
                                //     isDismissible: true);
                              } else {
                                Get.bottomSheet(AccountResModal(),
                                        isScrollControlled: true)
                                    .then((value) => null);
                              }
                            },
                            child: Container(
                              width: 94.87,
                              height: 132.97,
                              padding: const EdgeInsets.all(17.09),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.69,
                                    height: 60.69,
                                    decoration: ShapeDecoration(
                                      color: Constants.bgColor(),
                                      shape: const OvalBorder(),
                                    ),
                                    child: Icon(
                                      FontAwesome.send,
                                      color: Constants.txtSecColor(), //
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Payment',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.cardTextColor(),
                                      fontSize: 15.38,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.43,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Transactions Records',
                              style: TextStyle(
                                  color: Constants.txtSecColor(),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.5),
                            ),
                            const Spacer(),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                //AllTransactions
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        AllTransactions(),
                                  ),
                                );

                                // Get.put(KycAPI()).startkyc();
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    color: Constants.txtSecColor(),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (transactionsRecords.isEmpty) ...[
                        const Spacer(),
                        Image.asset('assets/images/notransaction.png'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'No transaction',
                          style: TextStyle(
                              color: Constants.txtSecColor(),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        const Spacer(),
                      ] else
                        const SizedBox(
                          height: 30,
                        ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            ...transactionsRecords.map((record) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => TrasactionDetails(record: record));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 30,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: record.credit
                                                  ? const Color(0xffD7FFDB)
                                                  : const Color(0xffFFCAC8),
                                              shape: BoxShape.circle),
                                          child: record.credit
                                              ? const Icon(
                                                  MaterialCommunityIcons
                                                      .arrow_bottom_left_thin,
                                                  color: Color(0xff58D4A1),
                                                )
                                              : const Icon(
                                                  MaterialCommunityIcons
                                                      .arrow_top_right_thin,
                                                  color: Color(0xffFF4842),
                                                )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            record.description,
                                            style: TextStyle(
                                                color: Constants.txtColor(),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.6),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2,
                                            child: Text(
                                              record.ref,
                                              style: TextStyle(
                                                  color: Constants.txtColor(),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.6),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            record.timestamp,
                                            style: TextStyle(
                                                color: Constants.txtColor(),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        record.credit
                                            ? '+'
                                                    r'$' +
                                                record.amount
                                            : '-'
                                                    r'$' +
                                                record.amount,
                                        style: TextStyle(
                                            color: record.credit
                                                ? const Color(0xff58D4A1)
                                                : const Color(0xffE41D1D),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           if (Constants.store
                //                   .read("KYCDATA")['status']
                //                   .toString() ==
                //               "verified") {
                //             Get.bottomSheet(InlineCheckout(),
                //                 isScrollControlled: true, isDismissible: true);
                //           } else {
                //             Get.bottomSheet(AccountResModal(),
                //                     isScrollControlled: true)
                //                 .then((value) => null);
                //           }
                //         },
                //         child: Container(
                //           // alignment: Alignment.bottomRight,
                //           margin: const EdgeInsets.symmetric(horizontal: 20),
                //           padding: const EdgeInsets.all(15.0),
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: Constants.btnColor(),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.only(top: 5, right: 5),
                //             child: Image.asset(
                //               'assets/images/send.png',
                //               color: Colors.white,
                //               colorBlendMode: BlendMode.srcIn,
                //               height: 30,
                //               width: 30,
                //             ),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Text(
                //         'Payment',
                //         style: TextStyle(
                //             color: Constants.txtSecColor(),
                //             fontWeight: FontWeight.w400,
                //             fontSize: 12),
                //       ),
                //       const SizedBox(
                //         height: 30,
                //       ),
                //     ],
                //   ),
                // ),
                ischeckoutVisible.value
                    ? FinswichIframe(
                        balance: Constants.store
                            .read("USERWALLET")['balance']
                            .toString(),
                        ischeckoutVisible: ischeckoutVisible,
                        origin: window.location.origin,
                        publicKey: Constants.store.read('LOGININFO')['checkout']
                            ['public_key'],
                        // "live_public_8bf7ae2cae32405375135a9fcbd449b178587hodbpmbXvQSUX6Zyp4cPnCwSL7XFT9drk77IzOUepTA8g0Zne9ARPjBOX2ahKDdU17055",
                        reference: Constants.store.read('LOGININFO')['checkout']
                            ['reference'],
                      )
                    // InlineCheckouttt(
                    //     val: ischeckoutVisible,
                    //   )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}
