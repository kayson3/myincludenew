import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/models/savings.dart';
import 'package:includenew/models/trsansactions.dart';
import 'package:includenew/oldscreendata/savings/createsavingcontroller.dart';

import '../../colors.dart';

class SavingDetail extends StatelessWidget {
  final SavingsClass saving;
  SavingDetail({super.key, required this.saving});

  final newsavingwidgetcontroller = Get.put(Newsavingwidgetcontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 546,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 20),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
                child: Image.asset(
              'assets/images/authcard.png',
              height: 184,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
            Positioned(
                bottom: 120,
                // left: 70,
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width - 90,
                  child: Text(
                    'Wallet Balance',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                )),
            Positioned(
                bottom: 80,
                // left: 70,
                child: Text(
                  '₦100,340.00',
                  style: TextStyle(
                      color: Constants.txtSecColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                )),
            Positioned(
                bottom: 20,
                // left: 70,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        newsavingwidgetcontroller.step.value = 4;
                        // Get.dialog(
                        //   FundSavings(),
                        //   barrierDismissible: false,
                        // );
                      },
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: const Color(0xff0B112F),
                            borderRadius: BorderRadius.circular(6.4)),
                        child: const Center(
                          child: Text(
                            'Fund',
                            style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 70,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: const Color(0xff000000)),
                          borderRadius: BorderRadius.circular(6.4)),
                      child: const Center(
                        child: Text(
                          'Withdraw',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Recent Transactions',
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w600,
                fontSize: 14.5),
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
        ] else
          const SizedBox(
            height: 30,
          ),
        Expanded(
          child: ListView(
            children: [
              ...transactionsRecords.map((record) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  MaterialCommunityIcons.arrow_bottom_left_thin,
                                  color: Color(0xff58D4A1),
                                )
                              : const Icon(
                                  MaterialCommunityIcons.arrow_top_right_thin,
                                  color: Color(0xffFF4842),
                                )),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            record.description,
                            style: const TextStyle(
                                color: Color(0xff545454),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.6),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            record.ref,
                            style: const TextStyle(
                                color: Color(0xff545454),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.6),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            record.timestamp,
                            style: const TextStyle(
                                color: Color(0xff545454),
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
                );
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
