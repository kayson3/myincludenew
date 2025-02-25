// import 'package:badges/badges.dart';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/kyc.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/models/trsansactions.dart';
import 'package:includenew/screens_two/alltransactions.dart';
// import 'package:includenew/screens/finswich/inlinecheckouttest.dart';
import 'package:includenew/screens_two/profile/profile.dart';
import 'package:info_popup/info_popup.dart';
import 'package:intl/intl.dart';

import '../apis/userwallet.dart';
import '../finswich/nativeiframe.dart';
// import '../screens/banktransfer/banktransfer.dart';
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
    return Obx(
      () => Scaffold(
        backgroundColor: Constants.bgColor(),
        body: SafeArea(
            left: false,
            right: false,
            top: true,
            child: Obx(
              () => Stack(
                alignment: AlignmentDirectional.bottomEnd,
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
                  Obx(
                    () => Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                width: 13,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Hi, ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Constants.txtColor(),
                                        fontSize: 20,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                    // Text(
                                    //   Constants.appAlias(),
                                    //   //  +
                                    //   //     " " +
                                    //   //     Constants.store.read("LOGININFO")['user']['lastname'],

                                    //   // ${Constants.capitalizeText(inputText: Constants.store.read("LOGININFO")['user']['firstname'])}
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //       color: Constants.txtColor(),
                                    //       fontWeight: FontWeight.w700,
                                    //       fontSize: 22),
                                    // ),

                                    Text(
                                      'Welcome back!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Constants.txtColor(),
                                        fontSize: 15,
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
                          height: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Available balance',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            // const Spacer(),
                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       image: const DecorationImage(
                            //           image: AssetImage(
                            //             'assets/images/user.png',
                            //           ),
                            //           fit: BoxFit.fill),
                            //       borderRadius: BorderRadius.circular(25)),
                            //   // child: Image.asset(
                            //   //   'assets/images/oshapi1.png',
                            //   // ),
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              NumberFormat.simpleCurrency(
                                          // locale: Platform.localeName,
                                          name: Constants.store
                                              .read("USERWALLET")['currency'])
                                      .currencySymbol +
                                  Constants.moneyFormat(double.parse(Constants
                                      .store
                                      .read("USERWALLET")['balance']
                                      .toString())),
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 4,
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
                              height: 4,
                            ),
                            Text(
                              'Account ****${Constants.lastFour(Constants.store.read("LOGININFO")['user']['phone'])}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.cardTextColor(),
                                fontSize: 14,
                                fontFamily: 'e-Ukraine',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         ischeckoutVisible.value = true;
                            //       },
                            //       child: Container(
                            //         width: 70,
                            //         padding: const EdgeInsets.symmetric(
                            //             vertical: 12),
                            //         decoration: BoxDecoration(
                            //             color: Constants.btnColor(),
                            //             borderRadius:
                            //                 BorderRadius.circular(6.4)),
                            //         child: Center(
                            //           child: Text(
                            //             'Fund',
                            //             style: TextStyle(
                            //                 color: Constants.cardTextColor(),
                            //                 fontWeight: FontWeight.w600,
                            //                 fontSize: 11.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(width: 10),
                            //     GestureDetector(
                            //       onTap: () {
                            //         Get.bottomSheet(
                            //           BankTransfer(),
                            //           isScrollControlled: true,
                            //         );
                            //       },
                            //       child: Container(
                            //         width: 70,
                            //         padding: const EdgeInsets.symmetric(
                            //             vertical: 12),
                            //         decoration: BoxDecoration(
                            //             color: Colors.transparent,
                            //             border: Border.all(
                            //                 color: const Color(0xff000000)),
                            //             borderRadius:
                            //                 BorderRadius.circular(6.4)),
                            //         child: Center(
                            //           child: Text(
                            //             'Transfer',
                            //             style: TextStyle(
                            //                 color: Constants.cardTextColor(),
                            //                 fontWeight: FontWeight.w600,
                            //                 fontSize: 11.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: ShapeDecoration(
                              color: Constants.bgSecColor(),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              // shadows: [
                              //   BoxShadow(
                              //     color: Constants.bgSecColor(),
                              //     blurRadius: 12,
                              //     offset: const Offset(0, -4),
                              //     spreadRadius: 0,
                              //   )
                              // ],
                            ),
                            child: Column(children: [
                              const SizedBox(
                                height: 20,
                              ),
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
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                AllTransactions(),
                                          ),
                                        );
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Constants.btnColor(),
                                            )),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Constants.btnColor(),
                                          size: 15,
                                        ),
                                      ),
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
                                          Get.to(() => TrasactionDetails(
                                              record: record));
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
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: record.credit
                                                          ? const Color(
                                                              0xffD7FFDB)
                                                          : const Color(
                                                              0xffFFCAC8),
                                                      shape: BoxShape.circle),
                                                  child: record.credit
                                                      ? const Icon(
                                                          MaterialCommunityIcons
                                                              .arrow_bottom_left_thin,
                                                          color:
                                                              Color(0xff58D4A1),
                                                        )
                                                      : const Icon(
                                                          MaterialCommunityIcons
                                                              .arrow_top_right_thin,
                                                          color:
                                                              Color(0xffFF4842),
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
                                                        color: Constants
                                                            .txtColor(),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.6),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        2,
                                                    child: Text(
                                                      record.ref,
                                                      style: TextStyle(
                                                          color: Constants
                                                              .txtColor(),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12.6),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    record.timestamp,
                                                    style: TextStyle(
                                                        color: Constants
                                                            .txtColor(),
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                        ? const Color(
                                                            0xff58D4A1)
                                                        : const Color(
                                                            0xffE41D1D),
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
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  ischeckoutVisible.value
                      ? FinswichIframe(
                          balance: Constants.store
                              .read("USERWALLET")['balance']
                              .toString(),
                          ischeckoutVisible: ischeckoutVisible,
                          origin: window.location.origin,
                          publicKey: Constants.store
                              .read('LOGININFO')['checkout']['public_key'],
                          // "live_public_8bf7ae2cae32405375135a9fcbd449b178587hodbpmbXvQSUX6Zyp4cPnCwSL7XFT9drk77IzOUepTA8g0Zne9ARPjBOX2ahKDdU17055",
                          reference: Constants.store
                              .read('LOGININFO')['checkout']['reference'],
                        )
                      // InlineCheckouttt(
                      //     val: ischeckoutVisible,
                      //   )
                      : const SizedBox(),
                ],
              ),
            )),
        bottomNavigationBar: !ischeckoutVisible.value
            ? Container(
                color: Constants.bgSecColor(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BottomNavigationBar(
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Constants.bgColor(),
                      unselectedItemColor: Constants.bgColor(),
                      unselectedLabelStyle: TextStyle(
                        color: Constants.txtSecColor(),
                      ),
                      selectedLabelStyle: TextStyle(
                        color: Constants.txtSecColor(),
                      ),
                      backgroundColor: Constants.bgSecColor(),
                      onTap: (index) {
                        if (index == 0) {
                          ischeckoutVisible.value = true;
                        }
                        if (index == 1) {
                          Get.bottomSheet(
                            BankTransfer(),
                            isScrollControlled: true,
                          );
                        }
                        // if (index == 2) {
                        //   if (Constants.store
                        //           .read("KYCDATA")['status']
                        //           .toString() ==
                        //       "verified") {
                        //     Get.bottomSheet(InlineCheckout(),
                        //         isScrollControlled: true, isDismissible: true);
                        //   } else {
                        //     Get.bottomSheet(AccountResModal(),
                        //             isScrollControlled: true)
                        //         .then((value) => null);
                        //   }
                        // }
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(
                                MaterialCommunityIcons.wallet_plus_outline),
                            label: "Fund"),
                        BottomNavigationBarItem(
                            icon: Icon(MaterialIcons.drive_file_move_outline),
                            label: "Withdrawal"),
                        BottomNavigationBarItem(
                            icon: Icon(MaterialIcons.payments),
                            label: "Payment"),
                      ]),
                ),
              )
            : null,
      ),
    );
  }
}
