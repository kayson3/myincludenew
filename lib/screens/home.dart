// import 'package:badges/badges.dart';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/kyc.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/finswich/nativeiframe.dart';
import 'package:includenew/models/trsansactions.dart';
import 'package:includenew/screens/alltransactions.dart';
// import 'package:includenew/screens/banktransfer/banktransfer.dart';
// import 'package:includenew/screens/finswich/inlinecheckouttest.dart';
import 'package:includenew/screens/profile/profile.dart';
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

  final userwallet = Get.put(UserWallet());

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
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
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        Constants.applogo(),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Text(
                                Constants.appAlias(),
                                //  +
                                //     " " +
                                //     Constants.store.read("LOGININFO")['user']['lastname'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Constants.txtSecColor(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${Constants.getGreeting()} ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])},",
                          style: const TextStyle(
                              color: Color(0xff86849B),
                              fontWeight: FontWeight.w700,
                              fontSize: 10.9),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                            height: 184,
                            width: double.infinity,
                            // margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                color: Constants.cardbgColor(),
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Wallet Balance',
                                        style: TextStyle(
                                            color: Constants.cardTextColor(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 30,
                                        height: 30,
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
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    NumberFormat.simpleCurrency(
                                                // locale: Platform.localeName,
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
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          ischeckoutVisible.value = true;

                                          // Get.to(() => InlineCheckout());
                                          // Get.bottomSheet(InlineCheckout(),
                                          //     isScrollControlled: true,
                                          //     isDismissible: true);
                                          // if (Constants.store
                                          //         .read("KYCDATA")['status'] ==
                                          //     "verified") {
                                          //   Get.bottomSheet(InlineCheckout(),
                                          //       isScrollControlled: true,
                                          //       isDismissible: true);
                                          // } else {
                                          //   Get.bottomSheet(AccountResModal(),
                                          //       isScrollControlled: true);
                                          // }
                                          // Get.dialog(
                                          //   FundWallet(),
                                          //   barrierDismissible: false,
                                          // );
                                        },
                                        child: Container(
                                          width: 70,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          decoration: BoxDecoration(
                                              color: Constants.btnColor(),
                                              borderRadius:
                                                  BorderRadius.circular(6.4)),
                                          child: Center(
                                            child: Text(
                                              'Fund',
                                              style: TextStyle(
                                                  color:
                                                      Constants.btnSecColor(),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          // if (Constants.store
                                          //         .read("KYCDATA")['status']
                                          //         .toString() ==
                                          //     "verified") {
                                          //   Get.bottomSheet(InlineCheckout(),
                                          //       isScrollControlled: true,
                                          //       isDismissible: true);
                                          // } else {
                                          //   Get.bottomSheet(AccountResModal(),
                                          //       isScrollControlled: true);
                                          // }

                                          Get.bottomSheet(
                                            BankTransfer(),
                                            isScrollControlled: true,
                                          );
                                        },
                                        child: Container(
                                          width: 70,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Constants.btnColor(),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.4)),
                                          child: Center(
                                            child: Text(
                                              'Transfer',
                                              style: TextStyle(
                                                  color: Constants.btnColor(),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),

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
                        const SizedBox(height: 30),
                        Row(
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
                        ] else
                          const SizedBox(
                            height: 30,
                          ),
                        Expanded(
                          child: ListView(
                            children: [
                              ...transactionsRecords.map((record) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        TrasactionDetails(record: record));
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
                                                  1.9,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ischeckoutVisible.value = true;
                            // if (Constants.store
                            //         .read("KYCDATA")['status']
                            //         .toString() ==
                            //     "verified") {
                            //   ischeckoutVisible.value = true;

                            //   // Get.bottomSheet(InlineCheckout(),
                            //   //     isScrollControlled: true,
                            //   //     isDismissible: true);
                            // } else {
                            //   Get.bottomSheet(AccountResModal(),
                            //           isScrollControlled: true)
                            //       .then((value) => null);
                            // }
                          },
                          child: Container(
                            // alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.btnColor(),
                            ),
                            child:
                                //  SvgPicture.asset("assetName",
                                //     colorFilter: const ColorFilter.mode(
                                //         Colors.red, BlendMode.srcIn),
                                //     semanticsLabel: 'A red up arrow'),
                                Padding(
                              padding: const EdgeInsets.only(top: 5, right: 5),
                              child: Image.asset(
                                'assets/images/send.png',
                                color: Constants.btnSecColor(),
                                colorBlendMode: BlendMode.srcIn,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Payment',
                          style: TextStyle(
                              color: Constants.txtSecColor(),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),

                //65a9033e3edd2c68126a8fb4
                //live_public_8bf7ae2cae32405375135a9fcbd449b178587hodbpmbXvQSUX6Zyp4cPnCwSL7XFT9drk77IzOUepTA8g0Zne9ARPjBOX2ahKDdU17055
                //http://127.0.0.1:5500
                ischeckoutVisible.value
                    ? FinswichIframe(
                        balance: Constants.store
                            .read("USERWALLET")['balance']
                            .toString(),
                        ischeckoutVisible: ischeckoutVisible,

                        origin: window.location
                            .origin, //window.location.origin,  "https://anotherrandomapp.useinclude.com"  import 'dart:html';
                        //
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
