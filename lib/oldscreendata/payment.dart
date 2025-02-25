import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/oldscreendata/airtime/airtime.dart';
import 'package:includenew/oldscreendata/banktransfer/banktransfer.dart';
import 'package:includenew/oldscreendata/data/data.dart';
import 'package:includenew/oldscreendata/fundwallet/fundwallet.dart';
import 'package:includenew/oldscreendata/giftcard/giftcard.dart';
import 'package:includenew/oldscreendata/power/powersubscription.dart';
import 'package:includenew/oldscreendata/savings/savings.dart';
import 'package:includenew/oldscreendata/subscription/subscription.dart';
import 'package:includenew/oldscreendata/tvsub/tvsub.dart';
import 'package:includenew/oldscreendata/wallettransfer/wallettransfer.dart';
import 'package:includenew/widgets/paymentbox.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 671,
        decoration: const BoxDecoration(
          color: Color(0xfff6f6f6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
        ),
        child: Column(children: [
          Container(
            height: 238, //232D51
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: const BoxDecoration(
              color: Color(0xff232D51),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(44),
                topRight: Radius.circular(44),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 3.5, //232D51
                    width: 112,
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5).withOpacity(0.46),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Image.asset('assets/images/clipart.png'),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Avis Charles A',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xfff6f6f6),
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet Balance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w400,
                              fontSize: 9),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          r'$20,000.32',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet ID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w400,
                              fontSize: 9),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '23481010181',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 100,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box(
                    icon: const Icon(
                      Entypo.wallet,
                      size: 30,
                      color: Color(0xff293B96),
                    ),
                    img: '',
                    title: 'Wallet',
                    onTap: () {
                      Get.dialog(
                        WalletTransfer(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Transfer',
                    textColor: const Color(0xff293B96),
                    boxColor: const Color(0xffDDEEFF)),
                const SizedBox(
                  width: 5,
                ),
                box(
                    icon: const Icon(
                      FontAwesome.bank,
                      color: Color(0xff7C176F),
                      size: 30,
                    ),
                    img: '',
                    title: 'Bank',
                    textColor: const Color(0xff7C176F),
                    onTap: () {
                      Get.dialog(
                        BankTransfer(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Transfer',
                    boxColor: const Color(0xffF6DDFF)),
                const SizedBox(
                  width: 5,
                ),
                box(
                    icon: const Icon(
                      MaterialCommunityIcons.wallet_plus,
                      size: 30,
                      color: Color(0xff7D1414),
                    ),
                    img: '',
                    title: 'Fund',
                    textColor: const Color(0xff7D1414),
                    onTap: () {
                      Get.dialog(
                        FundWallet(),
                        barrierDismissible: false,
                      );
                      // Get.
                    },
                    subtitle: 'Wallet',
                    boxColor: const Color(
                        0xffFFDEDE)), //MaterialCommunityIcons.wallet_plus
                const SizedBox(
                  width: 5,
                ),
                box(
                  icon: const Icon(
                    MaterialIcons.attach_money,
                    size: 30,
                    color: Color(0xffBC8802),
                  ),
                  img: '',
                  title: 'Gift',
                  onTap: () {
                    Get.dialog(
                      GiftCard(),
                      barrierDismissible: false,
                    );
                  },
                  subtitle: 'Cards',
                  boxColor: const Color(0xffFFF1CE),
                  textColor: const Color(0xffBC8802),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box(
                    icon: const Icon(
                      Entypo.tv,
                      color: Color(0xff00AC95),
                      size: 30,
                    ),
                    img: '',
                    title: 'Subscription',
                    textColor: const Color(0xff00AC95),
                    onTap: () {
                      Get.dialog(
                        Subscription(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Services',
                    boxColor: const Color(0xffE4FFFC)),
                const SizedBox(
                  width: 5,
                ),
                box(
                    icon: const Icon(
                      Ionicons.md_bulb_outline,
                      size: 30,
                      color: Color(0xff5CB900),
                    ),
                    img: '',
                    title: 'Power',
                    onTap: () {
                      Get.dialog(
                        PowerSub(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Subscription',
                    textColor: const Color(0xff5CB900), //E9FFD2
                    boxColor: const Color(0xffE9FFD2)),
                const SizedBox(
                  width: 5,
                ),
                box(
                    img: '',
                    icon: const Icon(
                      MaterialCommunityIcons.cellphone_check,
                      size: 30,
                      color: Color(0xffFF5932),
                    ),
                    title: '',
                    textColor: const Color(0xffFF5932),
                    onTap: () {
                      Get.dialog(
                        Airtime(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Airtime',
                    boxColor: const Color(0xffFAE5E0)),
                const SizedBox(
                  width: 5,
                ),
                box(
                    img: '',
                    icon: const Icon(
                      MaterialCommunityIcons.cellphone_wireless,
                      size: 30,
                      color: Color(0xff4001C5),
                    ),
                    title: '',
                    textColor: const Color(0xff4001C5),
                    onTap: () {
                      Get.dialog(
                        Data(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Data',
                    boxColor: const Color(0xffDECFFF)),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box(
                    icon: const Icon(
                      Ionicons.tv,
                      size: 30,
                      color: Color(0xff5CB900),
                    ),
                    img: '',
                    title: 'Tv',
                    onTap: () {
                      Get.dialog(
                        TvSub(),
                        barrierDismissible: false,
                      );
                    },
                    subtitle: 'Subscription',
                    textColor: const Color(0xff5CB900), //E9FFD2
                    boxColor: const Color(0xffE9FFD2)),
                box(
                  icon: const Icon(
                    MaterialIcons.attach_money,
                    size: 30,
                    color: Color(0xff7C176F),
                  ),
                  img: '',
                  title: 'Savings',
                  onTap: () {
                    Get.dialog(
                      Savings(),
                      barrierDismissible: false,
                    );
                  },
                  subtitle: 'Plan',
                  boxColor: const Color(0xffFFF5DD),
                  textColor: const Color(0xff7C176F),
                ),
                box(
                  icon: const Icon(
                    MaterialIcons.attach_money,
                    size: 30,
                    color: Color(0xfff6f6f6),
                  ),
                  img: '',
                  title: 'Savings',
                  onTap: () {
                    // Get.dialog(
                    //   Savings(),
                    //   barrierDismissible: false,
                    // );
                  },
                  subtitle: 'Plan',
                  boxColor: const Color(0xfff6f6f6),
                  textColor: const Color(0xfff6f6f6),
                ),
                box(
                  icon: const Icon(
                    MaterialIcons.attach_money,
                    size: 30,
                    color: Color(0xfff6f6f6),
                  ),
                  img: '',
                  title: 'Savings',
                  onTap: () {
                    // Get.dialog(
                    //   Savings(),
                    //   barrierDismissible: false,
                    // );
                  },
                  subtitle: 'Plan',
                  boxColor: const Color(0xfff6f6f6),
                  textColor: const Color(0xfff6f6f6),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            'Powered by',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff9F9F9F),
                fontWeight: FontWeight.w500,
                fontSize: 10.8),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  height: 25.4,
                  width: 25.4,
                  decoration: BoxDecoration(
                      color: const Color(0xff232D51),
                      borderRadius: BorderRadius.circular(3.09)),
                  child: Image.asset(
                    'assets/images/finswich.png',
                    width: 13.6,
                    height: 17,
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Fin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff232D51),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              const Text(
                'Swich',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff232D51),
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              ),
            ],
          )
        ]));
  }
}
