import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/userwallet.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/models/trsansactions.dart';
import 'package:intl/intl.dart';

import '../trasaction_details.dart';

class AllTransactions extends StatelessWidget {
  AllTransactions({super.key});
  final controller = Get.put(UserWallet());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgSecColor(),
      body: SafeArea(
        left: false,
        right: false,
        bottom: true,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Constants.btnColor(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Spacer(),
                      Text(
                        'All Transactions',
                        style: TextStyle(
                            color: Constants.txtSecColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      // GestureDetector(
                      //   onTap: () {
                      //     showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate: DateTime(2010),
                      //       lastDate: DateTime(2025),
                      //       builder: (context, child) {
                      //         return Theme(
                      //           data: Theme.of(context).copyWith(
                      //             colorScheme: const ColorScheme.light(
                      //               primary: Color(0xff232D51), // <-- SEE HERE
                      //               onPrimary: Color(0xfff6f6f6), // <-- SEE HERE
                      //               onSurface: Color(0xff5A5A5A), // <-- SEE HERE
                      //             ),
                      //             textButtonTheme: TextButtonThemeData(
                      //               style: TextButton.styleFrom(
                      //                 foregroundColor: const Color(
                      //                     0xff3168F4), // button text color
                      //               ),
                      //             ),
                      //           ),
                      //           child: child!,
                      //         );
                      //       },
                      //     ).then((value) {
                      //       // if (recordList
                      //       //     .isNotEmpty) {
                      //       //   // if (value !=
                      //       //   //     null) {
                      //       //   //   List<Records> newList = recordList
                      //       //   //       .where((p0) =>
                      //       //   //           DateTime.parse(p0.createdat!).day == value.day &&
                      //       //   //           DateTime.parse(p0.createdat!).year ==
                      //       //   //               value.year &&
                      //       //   //           DateTime.parse(p0.createdat!).month == value.month)
                      //       //   //       .toList();

                      //       //   //   recordListt
                      //       //   //           .value =
                      //       //   //       newList;
                      //       //   // }

                      //       // } else {
                      //       //   // ToastContext()
                      //       //   //     .init(
                      //       //   //         context);
                      //       //   // Toast.show(
                      //       //   //     "No Records",
                      //       //   //     duration:
                      //       //   //         Toast
                      //       //   //             .lengthShort,
                      //       //   //     gravity: Toast
                      //       //   //         .bottom);
                      //       // }
                      //       return null;
                      //     });
                      //   },
                      //   child: const Icon(
                      //       MaterialCommunityIcons.calendar_multiselect,
                      //       color: Color(0xff292D32)),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      color: Constants.cardbgColor(),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Constants.cardImage().toString().isEmpty
                              ? const AssetImage('assets/images/cardtemp2.png')
                              : NetworkImage(Constants.cardImage())
                                  as ImageProvider<Object>,
                          fit: BoxFit.contain,
                          opacity: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              // width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                'Transaction summary',
                                style: TextStyle(
                                    color: Constants.cardTextColor(),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${NumberFormat.simpleCurrency(
                                  // locale: Platform.localeName,
                                  name: Constants.store.read("USERWALLET")['currency']).currencySymbol} ${controller.teansactionResponse.isEmpty ? Constants.moneyFormat(0) : Constants.moneyFormat(double.parse((controller.teansactionResponse['total_incoming']).toString()))}', // '₦100,340.00',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700, //- ₦0.00
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "-"
                              '${NumberFormat.simpleCurrency(
                                  // locale: Platform.localeName,
                                  name: Constants.store.read("USERWALLET")['currency']).currencySymbol} ${controller.teansactionResponse.isEmpty ? Constants.moneyFormat(0) : Constants.moneyFormat(double.parse((controller.teansactionResponse['total_incoming']).toString()))}',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700, //- ₦0.00
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ])),
                ),
                const SizedBox(height: 30),
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    children: [
                      ...transactionsRecords.map((record) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => TrasactionDetails(record: record));
                          },
                          child: Padding(
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
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 2,
                                      child: Text(
                                        record.ref,
                                        style: const TextStyle(
                                            color: Color(0xff545454),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.6),
                                      ),
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
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            // Positioned(
            //   right: 30,
            //   bottom: 50,
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Container(
            //       width: 128,
            //       height: 40,
            //       padding: const EdgeInsets.all(6),
            //       decoration: ShapeDecoration(
            //         color: Constants.btnColor(),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(6)),
            //       ),
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             ColorFiltered(
            //                 colorFilter: const ColorFilter.matrix([
            //                   -1,
            //                   0,
            //                   0,
            //                   0,
            //                   255,
            //                   0,
            //                   -1,
            //                   0,
            //                   0,
            //                   255,
            //                   0,
            //                   0,
            //                   -1,
            //                   0,
            //                   255,
            //                   0,
            //                   0,
            //                   0,
            //                   1,
            //                   0,
            //                 ]),
            //                 child: Icon(
            //                   Icons.home_outlined,
            //                   color: Constants.bgColor(),
            //                 )),
            //             ColorFiltered(
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
            //               child: Text(
            //                 'Home',
            //                 style: TextStyle(
            //                   color: Constants.bgColor(),
            //                   fontSize: 12,
            //                   fontFamily: 'Manrope',
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ),
            //             ColorFiltered(
            //                 colorFilter: const ColorFilter.matrix([
            //                   -1,
            //                   0,
            //                   0,
            //                   0,
            //                   255,
            //                   0,
            //                   -1,
            //                   0,
            //                   0,
            //                   255,
            //                   0,
            //                   0,
            //                   -1,
            //                   0,
            //                   255,
            //                   0,
            //                   0,
            //                   0,
            //                   1,
            //                   0,
            //                 ]),
            //                 child: Icon(
            //                   Icons.arrow_forward,
            //                   color: Constants.bgColor(),
            //                 )),
            //           ]),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
