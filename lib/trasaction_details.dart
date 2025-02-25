import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:intl/intl.dart';

import 'models/trsansactions.dart';

class TrasactionDetails extends StatelessWidget {
  TrasactionDetails({super.key, required this.record});

  TransactionsRecords record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        bottom: true,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Constants.txtSecColor(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Transaction Details',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.credit
                                ? '+'
                                        r'$' +
                                    record.amount
                                : '-'
                                        r'$' +
                                    record.amount,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: record.credit
                                    ? const Color(0xff58D4A1)
                                    : const Color(0xffE41D1D),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Txn Reference",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.ref,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Wallet ID",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.walletid.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.credit == true ? "incoming" : "outgoing",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.description,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Currency",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.currency.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            DateFormat("hh:mm a dd-MM-yyyy").format(
                                DateTime.parse(record.rawtime.toString())),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Verification Code",
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            record.verificationCode.toString(),
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
