// import 'package:badges/badges.dart';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/kyc.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/finswich/nativeiframe.dart';
import 'package:includenew/models/trsansactions.dart';
// import 'package:includenew/screens/banktransfer/banktransfer.dart';
import 'package:includenew/screens_four/alltransactions.dart';
// import 'package:includenew/screens/finswich/inlinecheckouttest.dart';
import 'package:includenew/screens_four/profile/profile.dart';
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

  RxInt index = 0.obs;

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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
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
                            const Spacer(),
                            Icon(
                              MaterialCommunityIcons.qrcode_scan,
                              color: Constants.txtSecColor(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 109,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Constants.cardbgColor(),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Constants.btnColor(),
                                          shape: BoxShape.circle),
                                      child: SizedBox(
                                        width: 15.46,
                                        height: 11.97,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/temp_four/cardtempfour.png",
                                            width: 15.46,
                                            height: 12.97,
                                            color: Constants.bgColor(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Virtual Cards',
                                      style: TextStyle(
                                        color: Constants.cardTextColor(),
                                        fontSize: 11,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 109,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Constants.cardbgColor(),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Constants.btnColor(),
                                          shape: BoxShape.circle),
                                      child: SizedBox(
                                        width: 15.46,
                                        height: 11.97,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/temp_four/utilitiestempfour.png",
                                            width: 15.46,
                                            height: 12.97,
                                            color: Constants.bgColor(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Utilites',
                                      style: TextStyle(
                                        color: Constants.cardTextColor(),
                                        fontSize: 11,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 109,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Constants.cardbgColor(),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Constants.btnColor(),
                                          shape: BoxShape.circle),
                                      child: SizedBox(
                                        width: 15.46,
                                        height: 11.97,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/temp_four/invitefriendtempfour.png",
                                            width: 15.46,
                                            height: 12.97,
                                            color: Constants.bgColor(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Invite Friends',
                                      style: TextStyle(
                                        color: Constants.cardTextColor(),
                                        fontSize: 11,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 190,
                        child: PageView(
                          onPageChanged: (ind) {
                            index.value = ind;
                          },
                          children: [
                            Container(
                              height: 129,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              decoration: BoxDecoration(
                                color: Constants.cardbgColor(),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r'Fund $10 to get $3',
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 11,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          r'Fund $10 & get $3 instantly.',
                                          style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontSize: 20,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/temp_four/logingraphic.png",
                                        width: 113,
                                        height: 81,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'NGN Balance',
                                        style: TextStyle(
                                          color: Constants.btnColor(),
                                          fontSize: 12,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt,
                                        color: Constants.btnColor(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 129,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              decoration: BoxDecoration(
                                color: Constants.cardbgColor(),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r'Fund $10 to get $3',
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 11,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          r'Fund $10 & get $3 instantly.',
                                          style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontSize: 20,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/temp_four/logingraphic.png",
                                        width: 113,
                                        height: 81,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'NGN Balance',
                                        style: TextStyle(
                                          color: Constants.btnColor(),
                                          fontSize: 12,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt,
                                        color: Constants.btnColor(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 129,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              decoration: BoxDecoration(
                                color: Constants.cardbgColor(),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r'Fund $10 to get $3',
                                    style: TextStyle(
                                      color: Constants.txtColor(),
                                      fontSize: 11,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          r'Fund $10 & get $3 instantly.',
                                          style: TextStyle(
                                            color: Constants.txtColor(),
                                            fontSize: 20,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/temp_four/logingraphic.png",
                                        width: 113,
                                        height: 81,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'NGN Balance',
                                        style: TextStyle(
                                          color: Constants.btnColor(),
                                          fontSize: 12,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt,
                                        color: Constants.btnColor(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (int inde) => Container(
                                  height: 2,
                                  width: 13,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  color: index.value == inde
                                      ? Constants.btnColor()
                                      : Constants.cardbgColor(),
                                ),
                            growable: true),
                      ),
                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'NGN Balance',
                            style: TextStyle(
                              color: Constants.txtColor(),
                              fontSize: 11,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Constants.txtColor(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${NumberFormat.simpleCurrency(name: 'NGN').currencySymbol} 0.00",
                        style: TextStyle(
                          color: Constants.txtColor(),
                          fontSize: 30,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        NumberFormat.simpleCurrency(
                                    // locale: Platform.localeName,
                                    name: Constants.store
                                        .read("USERWALLET")['currency'])
                                .currencySymbol +
                            Constants.moneyFormat(double.parse(Constants.store
                                .read("USERWALLET")['balance']
                                .toString())),
                        style: TextStyle(
                          color: Constants.txtColor(),
                          fontSize: 11,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ischeckoutVisible.value = true;
                            },
                            child: Container(
                              width: 124,
                              height: 43,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17.09),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Fund',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.cardTextColor(),
                                    fontSize: 15.38,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                BankTransfer(),
                                isScrollControlled: true,
                              );
                            },
                            child: Container(
                              width: 124,
                              height: 43,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17.09),
                              decoration: ShapeDecoration(
                                color: Constants.cardbgColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Send',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.cardTextColor(),
                                    fontSize: 15.38,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'RECENT ACTIVITY',
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
                                'VIEW ALL',
                                style: TextStyle(
                                    color: Constants.btnColor(),
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
                                      Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          const CircleAvatar(
                                            radius: 12,
                                            child: Icon(MaterialCommunityIcons
                                                .account_circle),
                                          ),
                                          record.credit
                                              ? Icon(
                                                  AntDesign.arrowright,
                                                  color: Constants.txtColor(),
                                                  size: 12,
                                                )
                                              : Icon(
                                                  AntDesign.arrowleft,
                                                  color: Constants.txtColor(),
                                                  size: 12,
                                                ),
                                        ],
                                      ),
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
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
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
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              record.timestamp,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Constants.txtColor(),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
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
