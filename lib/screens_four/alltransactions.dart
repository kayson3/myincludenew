import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/userwallet.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/models/trsansactions.dart';

import '../trasaction_details.dart';

class AllTransactions extends StatelessWidget {
  AllTransactions({super.key});
  final controller = Get.put(UserWallet());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor(),
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
                          Icons.close,
                          color: Constants.txtSecColor(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Spacer(),
                      Text(
                        'Activity',
                        style: TextStyle(
                            color: Constants.txtSecColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width:
                                          MediaQuery.sizeOf(context).width / 2,
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
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      style: TextStyle(
                                          color: Constants.txtColor(),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                  ],
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
