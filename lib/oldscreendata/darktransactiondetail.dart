// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/viewevidence.dart';

class DarkTransactionDetail extends StatelessWidget {
  DarkTransactionDetail({
    Key? key,
  }) : super(key: key);

  // Records record;
  RxInt index = 0.obs;
  RxBool inTransaction = false.obs;

  @override
  Widget build(BuildContext context) {
    String time1 = '';
    //  (48 -
    //         ((DateTime.now()
    //                 .difference(DateTime.parse(record.createdat!))
    //                 .inMinutes) /
    //             60))
    //     .toString();
    String hr = time1.split('.').first;
    String min =
        (double.parse('0.' + time1.split('.').last) * 60).round().toString();
    return Scaffold(
      backgroundColor: const Color(0xff0A254E),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xfff6f6f6),
            )),
        backgroundColor: const Color(0xff0A254E),
        elevation: 0,
        leadingWidth: 25,
        centerTitle: false,
        title: const Text(
          'Transaction',
          style: TextStyle(
              color: Color(0xfff6f6f6),
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Obx(
            //   () => Center(
            //     child: AnimatedContainer(
            //       duration: const Duration(milliseconds: 300),
            //       width: MediaQuery.of(context).size.width / 1.2,
            //       decoration: BoxDecoration(
            //           border: Border.all(color: const Color(0xfff6f6f6)),
            //           borderRadius: BorderRadius.circular(60)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           GestureDetector(
            //             onTap: () => index.value = 0,
            //             child: Container(
            //               width: MediaQuery.of(context).size.width / 2.5,
            //               decoration: BoxDecoration(
            //                 color: index.value == 0
            //                     ? const Color(0xfff6f6f6)
            //                     : const Color(0xfff6f6f6),
            //                 borderRadius: BorderRadius.circular(60),
            //               ),
            //               child: Center(
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(
            //                       vertical: 10.0,
            //                       horizontal: index.value == 0 ? 29 : 19),
            //                   child: Text(
            //                     'Transaction',
            //                     style: TextStyle(
            //                       color: index.value == 0
            //                           ? const Color(0xfff6f6f6)
            //                           : const Color(0xfff6f6f6),
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () => index.value = 1,
            //             child: Container(
            //               width: MediaQuery.of(context).size.width / 2.5,
            //               decoration: BoxDecoration(
            //                 color: index.value == 1
            //                     ? const Color(0xfff6f6f6)
            //                     : const Color(0xfff6f6f6),
            //                 borderRadius: BorderRadius.circular(60),
            //               ),
            //               child: Center(
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(
            //                       vertical: 10.0,
            //                       horizontal: index.value == 1 ? 29 : 19),
            //                   child: Text(
            //                     'Chat',
            //                     style: TextStyle(
            //                       color: index.value == 1
            //                           ? const Color(0xfff6f6f6)
            //                           : const Color(0xfff6f6f6),
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            index.value == 0
                ? Expanded(
                    child: ListView(
                      children: [
                        //More info
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'More info',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfff6f6f6),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Amount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Spacer(),
                              Text(
                                'N12,450',
                                // record.type == 'DR'
                                //     ? r'-' +
                                //         NumberFormat.simpleCurrency(
                                //                 locale: Platform.localeName,
                                //                 name: record.currencysymbol)
                                //             .currencySymbol +
                                //         record.amount.toStringAsFixed(2)
                                //     : NumberFormat.simpleCurrency(
                                //                 locale: Platform.localeName,
                                //                 name: record.currencysymbol)
                                //             .currencySymbol +
                                //         record.amount.toStringAsFixed(2),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                r'($10.00)',
                                // record.type == 'DR'
                                //     ? '('
                                //             r'-$' +
                                //         record.usdtamount!.toStringAsFixed(2) +
                                //         ')'
                                //     : '(' r'+$' +
                                //         record.usdtamount!.toStringAsFixed(2) +
                                // ')',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Type',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                // record.type == 'DR' ? 'Debit' :

                                'Credit',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ), //DEDEDE
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              const Text(
                                'Ref',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 190,
                                child: const Text(
                                  'WTD-1234MT00345345g',
                                  // record.ref,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // await Clipboard.setData(
                                  //     ClipboardData(text: record.ref));
                                  // ToastContext().init(context);
                                  // Toast.show("Copied!!",
                                  //     duration: Toast.lengthShort,
                                  //     gravity: Toast.bottom);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff8B97AE),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text(
                                    'Copy',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xfff6f6f6),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '10:00pm 23th Feb, 2023',
                                // DateFormat('h:mma d\'th\' MMM, y')
                                //     .format(DateTime.parse(record.createdat!)),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Ex Rate',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                r'N740/$1',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Process perk',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '9s',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        // const SizedBox(
                        //   height: 40,
                        // ),

                        // ///
                        // //////
                        // /////
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(horizontal: 25.0),
                        //     child: Text(
                        //       'Transaction Status',
                        //       style: TextStyle(
                        //         fontSize: 13,
                        //         fontWeight: FontWeight.w400,
                        //         color:
                        //             const Color(0xfff6f6f6).withOpacity(0.41),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Dispute Grace Period',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Spacer(),
                              // Text(
                              //   //
                              //   hr.contains('-')
                              //       ? '00:00h'
                              //       : hr + ':' + min + 'h', //48hr
                              //   style: const TextStyle(
                              //       fontSize: 11, color: Color(0xfff6f6f6)),
                              // ),
                              Text(
                                '48:03h',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Ex Rate',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                r'N740/$1',
                                // NumberFormat.simpleCurrency(
                                //             locale: Platform.localeName,
                                //             name: record.currencysymbol)
                                //         .currencySymbol +
                                //     record.rate!.toStringAsFixed(2) +
                                //     r'/$1',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                'Tx Status',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Spacer(),
                              Text(
                                // record.isCompleted ? 'Success' :
                                'Pending',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        // `  record.isCompleted
                                        //       ? const Color(0xff58D4A1)
                                        //       : `
                                        Color(0xffF49C16)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              const Text(
                                'Insurance',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff6f6f6),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // const Spacer()
                              Expanded(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  child: const Text(
                                    r'$1000',
                                    // record.tocryptoaddress!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffCE7A2C),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // await Clipboard.setData(ClipboardData(
                                  //     text: record.tocryptoaddress!));
                                  // ToastContext().init(context);
                                  // Toast.show("Copied!!",
                                  //     duration: Toast.lengthShort,
                                  //     gravity: Toast.bottom);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff8B97AE),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text(
                                    'Copy',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xfff6f6f6),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          color: const Color(0xff2D324B),
                        ),

                        // const SizedBox(
                        //   height: 40,
                        // ),

                        ///
                        //////
                        /////
                        ///
                        const SizedBox(
                          height: 30,
                        ),
                        if (true) ...[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'Beneficiary Details',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xfff6f6f6).withOpacity(0.41),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Bank',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  // record.currencysymbol ??

                                  'Wema Bank',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            color: const Color(0xff2D324B),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Account No.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  // record.currencysymbol ??

                                  '01145274781',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            color: const Color(0xff2D324B),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  // record.currencysymbol ??

                                  'Avis Charles A',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            color: const Color(0xff2D324B),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],

                        const Center(
                          child: Text(
                            'Payment Evidence',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfff6f6f6),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.dialog(ViewEvidence());
                          },
                          child: Container(
                            width: 97,
                            height: 38,
                            margin: const EdgeInsets.symmetric(horizontal: 150),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                border:
                                    Border.all(color: const Color(0xfff6f6f6))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  AntDesign.paperclip,
                                  color: Color(0xfff6f6f6),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff6f6f6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const Center(
                          child: Text(
                            'Report Transaction',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffEF1111),
                            ),
                          ),
                        ),

                        if (true) ...[
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 25.0),
                          //     child: Text(
                          //       'Beneficiary Details',
                          //       style: TextStyle(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.w400,
                          //         color:
                          //             const Color(0xfff6f6f6).withOpacity(0.41),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          // ...record.metadata!['user_bank_details'].map((e) {
                          //   return Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 25.0),
                          //     child: Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               e['name']
                          //                   .toString()
                          //                   .split('_')
                          //                   .map((e) =>
                          //                       e[0].toUpperCase() +
                          //                       e.substring(1).toLowerCase() +
                          //                       ' ')
                          //                   .toList()
                          //                   .join(),
                          //               style: const TextStyle(
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w400,
                          //                 color: Color(0xfff6f6f6),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             const Spacer(),
                          //             Text(
                          //               e['value'],
                          //               overflow: TextOverflow.ellipsis,
                          //               style: const TextStyle(
                          //                 fontSize: 15,
                          //                 fontWeight: FontWeight.w700,
                          //                 color: const Color(0xfff6f6f6),
                          //               ),
                          //             ),
                          //             if (e['name']
                          //                 .toString()
                          //                 .contains('number')) ...[
                          //               const SizedBox(
                          //                 width: 6,
                          //               ),
                          //               GestureDetector(
                          //                 onTap: () async {
                          //                   // await Clipboard.setData(
                          //                   //     ClipboardData(
                          //                   //         text: e[
                          //                   //             'value'])); //1475790337
                          //                   // ToastContext().init(context);
                          //                   // Toast.show("Copied!!",
                          //                   //     duration: Toast.lengthShort,
                          //                   //     gravity: Toast.bottom);
                          //                 },
                          //                 child: Container(
                          //                   padding: const EdgeInsets.symmetric(
                          //                       horizontal: 5, vertical: 3),
                          //                   decoration: BoxDecoration(
                          //                       color: const Color(0xff8B97AE),
                          //                       borderRadius:
                          //                           BorderRadius.circular(12)),
                          //                   child: const Text(
                          //                     'Copy',
                          //                     style: TextStyle(
                          //                       fontSize: 11,
                          //                       fontWeight: FontWeight.w700,
                          //                       color: Color(0xfff6f6f6),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               )
                          //             ]
                          //           ],
                          //         ),
                          //         const SizedBox(
                          //           height: 15,
                          //         ),
                          //         Container(
                          //           height: 1,
                          //           // margin: const EdgeInsets.symmetric(
                          //           //     horizontal: 25.0),
                          //           color: const Color(0xff2D324B),
                          //         ),
                          //         const SizedBox(
                          //           height: 15,
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // }).toList(),
                        ],

                        if (true
                        // record.metadata != null &&
                        //   record.metadata!.isNotEmpty &&
                        //   record.metadata!.containsKey('bank_details')
                        ) ...[
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 25.0),
                          //     child: Text(
                          //       'Beneficiary Details',
                          //       style: TextStyle(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.w400,
                          //         color:
                          //             const Color(0xfff6f6f6).withOpacity(0.41),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount:
                          //         1,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       String key = record
                          //           .metadata!['bank_details'].keys
                          //           .elementAt(index);
                          //       String value =
                          //           record.metadata!['bank_details'][key];
                          //       return Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             horizontal: 25.0),
                          //         child: Column(
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 Text(
                          //                   key
                          //                       .toString()
                          //                       .split('_')
                          //                       .map((e) =>
                          //                           e[0].toUpperCase() +
                          //                           e
                          //                               .substring(1)
                          //                               .toLowerCase() +
                          //                           ' ')
                          //                       .toList()
                          //                       .join(),
                          //                   style: const TextStyle(
                          //                     fontSize: 14,
                          //                     fontWeight: FontWeight.w400,
                          //                     color: Color(0xfff6f6f6),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 10,
                          //                 ),
                          //                 const Spacer(),
                          //                 Text(
                          //                   value,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: const TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.w700,
                          //                     color: Color(0xfff6f6f6),
                          //                   ),
                          //                 ),
                          //                 if (key
                          //                     .toString()
                          //                     .contains('number')) ...[
                          //                   const SizedBox(
                          //                     width: 6,
                          //                   ),
                          //                   GestureDetector(
                          //                     onTap: () async {
                          //                       // await Clipboard.setData(
                          //                       //     ClipboardData(
                          //                       //         text:
                          //                       //             value)); //1475790337
                          //                       // ToastContext().init(context);
                          //                       // Toast.show("Copied!!",
                          //                       //     duration: Toast.lengthShort,
                          //                       //     gravity: Toast.bottom);
                          //                     },
                          //                     child: Container(
                          //                       padding:
                          //                           const EdgeInsets.symmetric(
                          //                               horizontal: 5,
                          //                               vertical: 3),
                          //                       decoration: BoxDecoration(
                          //                           color:
                          //                               const Color(0xff8B97AE),
                          //                           borderRadius:
                          //                               BorderRadius.circular(
                          //                                   12)),
                          //                       child: const Text(
                          //                         'Copy',
                          //                         style: TextStyle(
                          //                           fontSize: 11,
                          //                           fontWeight: FontWeight.w700,
                          //                           color: Color(0xfff6f6f6),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   )
                          //                 ]
                          //               ],
                          //             ),
                          //             const SizedBox(
                          //               height: 15,
                          //             ),
                          //             Container(
                          //               height: 1,
                          //               // margin: const EdgeInsets.symmetric(
                          //               //     horizontal: 25.0),
                          //               color: const Color(0xff2D324B),
                          //             ),
                          //             const SizedBox(
                          //               height: 15,
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     }),
                        ],

                        // const Center(
                        //   child: Text(
                        //     'Send money to the same beneficiary again.',
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w400,
                        //       color: Color(0xfff6f6f6),
                        //     ),
                        //   ),
                        // ),

                        // const SizedBox(
                        //   height: 15,
                        // ),

                        // const SizedBox(
                        //   height: 15,
                        // ),

                        // const Center(
                        //   child: Text(
                        //     'Report Transaction',
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w400,
                        //       color: Color(0xffEF1111),
                        //     ),
                        //   ),
                        // ),

                        const SizedBox(
                          height: 50,
                        ),
                        ////
                      ],
                    ),
                  )
                : Expanded(
                    child: inTransaction.value
                        ? const SizedBox()
                        // TransactionMsg(record: record)
                        : Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  const Text(
                                    'Insurance Bal: ',
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfff6f6f6),
                                    ),
                                  ),
                                  const Text(
                                    r'$10',
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff58D4A1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffDB1B3E),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Soon!',
                                      style: TextStyle(
                                          color: Color(0xfff6f6f6),
                                          fontSize: 13.29,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1C2339),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Transaction Dispute',
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xfff6f6f6),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          r'$10',
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff58D4A1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'You are required to make an insurance deposit  to resolve this transaction.Kindly note, insurance deposits are on-refundable if your dispute claim is false. ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff6f6f6),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          // inTransaction.value = true;
                                        },
                                        child: Container(
                                          // height: ,
                                          // constraints: BoxConstraints(maxWidth: 64),
                                          // margin: const EdgeInsets.symmetric(
                                          //     horizontal: 35),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          decoration: BoxDecoration(
                                              color: const Color(0xff44CF95),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Text(
                                            'Agree & Start',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xfff6f6f6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
