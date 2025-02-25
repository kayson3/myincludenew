import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/colors.dart';
import 'package:includenew/models/savings.dart';
import 'package:includenew/oldscreendata/savings/savings1.dart';
import 'package:includenew/widgets/dialog.dart';

import '../../widgets/button.dart';

class NewSavings extends StatefulWidget {
  final SavingsType type;

  const NewSavings({
    super.key,
    required this.type,
    required this.savings,
  });

  final SavingsClass savings;

  @override
  State<NewSavings> createState() => _NewSavingsState();
}

class _NewSavingsState extends State<NewSavings> {
  // final savingscontroller = Get.put(SavingsController());

  // final paymentController = Get.put(PaymentController());

  RxBool isCalc = false.obs;

  RxString frequency = 'daily'.obs;

  final duration = Rxn<String>();

  // RxString duration = '4 months'.obs;

  RxList durationList = [
    '4 months',
    '6 months',
    '8 months',
    '10 months',
    '12 months',
  ].obs;

  RxBool autoSave = false.obs;

  final TextEditingController _amountContoller = TextEditingController();

  final TextEditingController _targetNameContoller = TextEditingController();
  final TextEditingController _targetAmountContoller = TextEditingController();
  final TextEditingController _targetDescrContoller = TextEditingController();

  RxBool isLoading = false.obs;

  RxString wallettofund = "₦".obs;

  // NumberFormat.simpleCurrency(locale: Platform.localeName)
  //     .currencySymbol
  //     .obs;

  // wallettofund = "₦".obs;

  List wallettofundList = ["₦", "₵", "KSH"];
  @override
  void initState() {
    // if (paymentController.rate_approx.value < 2) {
    //   isCalc.value = true;
    //   paymentController
    //       .currencyConvert(
    //           from: allmyfiatList[0].country_currency!.toLowerCase(),
    //           to: 'usdt',
    //           amount: '1',
    //           wallet: allmyfiatList[0])
    //       .then((value) {
    //     isCalc.value = false;
    //   });
    // }

    // wallettofund = NumberFormat.simpleCurrency(
    //         locale: Platform.localeName,
    //         name: allmyfiatList[0].country_currency ?? 'USD')
    //     .currencySymbol
    //     .obs;

    // widget.savings.savingsInterval;
    // widget.savings.savingsInterval =
    //     widget.savings.savingsInterval!.reversed.toList();
    // logger.d(widget.savings.savingsInterval);
    // widget.savings.savingsInterval!.sort((a, b) {
    //   if (a == 'Daily') {
    //     return -1;
    //   }
    //   return 1;
    //   // 1.compareTo(other)
    // });
    // widget.savings.savingsInterval!.sort((a, b) => a == 'Weekly' ? -2 : 2);

    widget.savings.savingsInterval!
        .sort((a, b) => a.length.compareTo(b.length));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: Container(
        height: 480,
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.vertical(top: Radius.circular(33))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(int.parse(widget.savings.colors?[0])),
                          Color(int.parse(widget.savings.colors?[1])),
                        ]),
                    shape: BoxShape.circle),
                child: const Padding(
                  padding: EdgeInsets.only(right: 4.0, bottom: 3),
                  child: Icon(
                    FontAwesome5Solid.piggy_bank,
                    color: Color(0xfff6f6f6),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.savings.name![0].toUpperCase() +
                    widget.savings.name!.substring(1),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff747474)),
              ),
              const SizedBox(
                height: 25,
              ),
              // widget.type == SavingsType.Gold
              //     ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: widget.savings.description!,
                      style: const TextStyle(
                          color: Color(0xff343131), fontSize: 12),
                    )),
              ),

              const SizedBox(
                height: 20,
              ),
              widget.savings.name!.toLowerCase() == 'target savings'
                  ? Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff3168f4),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        // borderColor: const Color(0xff3168F4),
                        onChanged: (v) {},

                        // keyboardType: TextInputType.phone,

                        controller: _targetNameContoller,
                        // inputFormatters: [
                        //   CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)
                        // ],
                        decoration: const InputDecoration(
                            hintText: 'Target Name',
                            isDense: true,
                            // isCollapsed: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xff7286C2),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15)),
                      ),
                    )
                  : const SizedBox(),

              widget.savings.name!.toLowerCase() == 'target savings'
                  ? const SizedBox(height: 10)
                  : const SizedBox(),

              widget.savings.name!.toLowerCase() == 'target savings'
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff3168f4),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Obx(
                              () => DropdownButtonHideUnderline(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: DropdownButton<String>(
                                    isDense: true,
                                    value: wallettofund.value,
                                    icon: const Icon(
                                      Entypo.chevron_thin_down,
                                      color: Color(0xff7286C2),
                                    ),
                                    iconSize: 0,
                                    hint: Text(
                                      wallettofund.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.29,
                                          color: Color(0XFF7286C2)),
                                    ),
                                    onChanged: (value) =>
                                        wallettofund.value = value!,
                                    items: null

                                    // wallettofundList
                                    //     .map((e) => DropdownMenuItem<String>(
                                    //           value: e,
                                    //           child: Text(
                                    //             e,
                                    //             style: GoogleFonts.mulish(
                                    //                 fontWeight: FontWeight.w700,
                                    //                 fontSize: 15.29,
                                    //                 color: const Color(0XFF7286C2)),
                                    //           ),
                                    //         ))
                                    //     .toList(),
                                    ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 1,
                              color: const Color(0xff3168f4),
                            ),
                            Expanded(
                              child: TextFormField(
                                // borderColor: const Color(0xff3168F4),
                                onChanged: (v) {},

                                keyboardType: TextInputType.phone,

                                controller: _targetAmountContoller,
                                inputFormatters: [
                                  CurrencyTextInputFormatter.currency(
                                      symbol: '', decimalDigits: 0)
                                ],
                                decoration: const InputDecoration(
                                    hintText: 'Target Amount',
                                    isDense: true,
                                    // isCollapsed: true,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Color(0xff7286C2),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15)),
                              ),
                            ),
                            // Expanded(
                            //   child: CustomTextFormField(
                            //     borderColor: const Color(0xff868686),
                            //     textColor: const Color(0xff868686),
                            //     hintText: 'Amount to save',
                            //     controller: _amountContoller,
                            //     keyboardType: TextInputType.phone,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff3168f4),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Obx(
                        () => DropdownButtonHideUnderline(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: DropdownButton<String>(
                              isDense: true,
                              value: wallettofund.value,
                              icon: const Icon(
                                Entypo.chevron_thin_down,
                                color: Color(0xff7286C2),
                              ),
                              iconSize: 0,
                              hint: Text(
                                wallettofund.value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.29,
                                    color: Color(0XFF7286C2)),
                              ),
                              onChanged: (value) => wallettofund.value = value!,
                              items: null

                              // wallettofundList
                              //     .map((e) => DropdownMenuItem<String>(
                              //           value: e,
                              //           child: Text(
                              //             e,
                              //             style: GoogleFonts.mulish(
                              //                 fontWeight: FontWeight.w700,
                              //                 fontSize: 15.29,
                              //                 color: const Color(0XFF7286C2)),
                              //           ),
                              //         ))
                              //     .toList(),
                              ),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: const Color(0xff3168f4),
                      ),
                      Expanded(
                        child: TextFormField(
                          // borderColor: const Color(0xff3168F4),
                          onChanged: (v) {
                            // if (v.isNotEmpty) {
                            //   paymentController.converted_amount.value =
                            //       (double.parse(_amountContoller.text
                            //                   .split(',')
                            //                   .join()) /
                            //               paymentController.rate_approx.value)
                            //           .toString();
                            // } else {
                            //   // dontproceed.value = false;
                            //   paymentController.converted_amount.value = "0";
                            // }
                            setState(() {});

                            return;
                          },

                          keyboardType: TextInputType.phone,

                          controller: _amountContoller,
                          inputFormatters: [
                            CurrencyTextInputFormatter.currency(
                                symbol: '', decimalDigits: 0)
                          ],
                          decoration: const InputDecoration(
                              hintText: 'Amount to save now',
                              isDense: true,
                              // isCollapsed: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xff7286C2),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15)),
                        ),
                      ),
                      // Expanded(
                      //   child: CustomTextFormField(
                      //     borderColor: const Color(0xff868686),
                      //     textColor: const Color(0xff868686),
                      //     hintText: 'Amount to save',
                      //     controller: _amountContoller,
                      //     keyboardType: TextInputType.phone,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                //
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text('Amount in USD',
                        style: TextStyle(
                            fontSize: 13.74,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7286C2))),
                    Spacer(),
                    // Obx(
                    //   () => isCalc.value
                    //       ? const Text('Calculating...',
                    //           style: TextStyle(
                    //               fontSize: 13.74,
                    //               fontWeight: FontWeight.w400,
                    //               color: Color(0xffFB6917)))
                    //       : _amountContoller.text.isEmpty
                    //           ? Text(
                    //               'Rate: $wallettofund${paymentController.rate_markdown_approx.value.toStringAsFixed(2)} to 1USD',
                    //               style: const TextStyle(
                    //                   fontSize: 13.74,
                    //                   fontWeight: FontWeight.w400,
                    //                   color: Color(0xffFB6917)))
                    //           : double.parse(paymentController
                    //                           .converted_amount.value)
                    //                       .toStringAsFixed(2) ==
                    //                   'Infinity'
                    //               ? const Text('Calculating...',
                    //                   style: TextStyle(
                    //                       fontSize: 13.74,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Color(0xffFB6917)))
                    //               : Text(
                    //                   '\$ ${double.parse(paymentController.converted_amount.value).toStringAsFixed(2)}',
                    //                   style: const TextStyle(
                    //                       fontSize: 13.74,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Color(
                    //                           0xff7286C2))), //double.parse(paymentController.converted_amount.value).toStringAsFixed(2)}
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                //
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('How do you prefer to save?',
                      style: TextStyle(
                          fontSize: 13.74,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7286C2))),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Container(
                height: 45,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff3168f4),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Obx(
                  () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    isDense: true,
                    value: frequency.value,
                    dropdownColor: const Color(0xff232D51).withOpacity(0.9),
                    icon: const Icon(
                      Entypo.chevron_thin_down,
                      color: Color(0xff7286C2),
                    ),
                    iconSize: 20,
                    hint: const Text(
                      'Savings Interval',
                      style: TextStyle(
                          // fontWeight: FontWeight.w700,
                          // fontSize: 15.29,
                          color: mainAppColor),
                    ),
                    onChanged: (value) => frequency.value = value!,
                    items: widget.savings.savingsInterval!
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    // fontSize: 15.29,
                                    color: Color(0xff7286C2)),
                              ),
                            ))
                        .toList(),
                  )),
                ),
              ),
              widget.savings.name!.toLowerCase() == 'target savings'
                  ? const SizedBox(height: 20)
                  : const SizedBox(),
              widget.savings.name!.toLowerCase() == 'target savings'
                  ? const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                            'For how long do you want to lock your funds',
                            style: TextStyle(
                                fontSize: 13.74,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7286C2))),
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(height: 10),

              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 25),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(color: const Color(0xff7286C2)),
              //     ),
              //     child: Obx(
              //       () => DropdownButtonHideUnderline(
              //           child: DropdownButton<String>(
              //         isDense: true,
              //         value: frequency.value,
              //         dropdownColor: mainAppColor.withOpacity(0.9),
              //         icon: const Icon(
              //           Entypo.chevron_thin_down,
              //           color: Color(0xff7286C2),
              //         ),
              //         iconSize: 20,
              //         hint: Text(
              //           'Savings Interval',
              //           style: TextStyle(
              //               fontWeight: FontWeight.w700,
              //               // fontSize: 15.29,
              //               color: mainAppColor),
              //         ),
              //         onChanged: (value) => frequency.value = value!,
              //         items: widget.savings.savingsInterval!
              //             .map((e) => DropdownMenuItem<String>(
              //                   value: e,
              //                   child: Text(
              //                     e,
              //                     style: const TextStyle(
              //                         fontWeight: FontWeight.w700,
              //                         // fontSize: 15.29,
              //                         color: Color(0xff7286C2)),
              //                   ),
              //                 ))
              //             .toList(),
              //       )),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),

              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //     child: Wrap(
              //         children: widget.savings.savingsInterval!.map((e) {
              //       return RadioListTile(
              //         title: Text(
              //           e.toString()[0].toUpperCase() + e.toString().substring(1),
              //           // overflow: TextOverflow.ellipsis,
              //         ),
              //         value: e.toString()[0].toUpperCase() +
              //             e.toString().substring(1),
              //         visualDensity: VisualDensity.compact,
              //         groupValue: frequency.value,
              //         contentPadding: EdgeInsets.zero,
              //         onChanged: (value) {
              //           frequency.value = value.toString();
              //         },
              //       );
              //     }).toList()),
              //   ),
              // ),
              Row(
                children: [
                  widget.savings.name!.toLowerCase() == 'target savings'
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 45,
                            // width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff3168f4),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                isDense: true,
                                value: duration.value,
                                dropdownColor: mainAppColor.withOpacity(0.9),
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Entypo.chevron_thin_down,
                                    color: Color(0xff7286C2),
                                  ),
                                ),
                                iconSize: 20,
                                hint: const Text(
                                  'Target month',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.w500,
                                      color: Color(0xff7286C2)),
                                ),
                                onChanged: (value) => duration.value = value!,
                                items: durationList
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                // fontWeight: FontWeight.w500,
                                                // fontSize: 15.29,
                                                color: Color(0xff7286C2)),
                                          ),
                                        ))
                                    .toList(),
                              )),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  widget.savings.name!.toLowerCase() == 'target savings'
                      ? const Spacer()
                      : const SizedBox(
                          width: 10,
                        ),
                  Obx(
                    () => Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        value: autoSave.value,
                        activeTrackColor: const Color(0xff232D51),
                        onChanged: (a) => autoSave.value = a,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 5,
                  // ),
                  const Text(
                    "Auto Save",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff343131)),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Button(
                color: const Color(0xff0B112F),
                buttonWidth: 124,
                buttonText: 'Start',
                // isLoading: isLoading.value,
                onTap: () {
                  Get.dialog(SuccessfulDialogs(
                    showloader: false,
                    showclose: true,
                    title: 'Success',
                    description: 'Created Sucessfully',
                  ));
                  // logger.d(
                  //     '${widget.savings.id} ${autoSave.value} ${frequency.value}');
                  if (_amountContoller.text.isNotEmpty) {
                    isLoading.value = true;

                    // if (widget.savings.name!.toLowerCase() ==
                    //     'target savings') {
                    // savingscontroller
                    //     .createSavings(
                    //       localamount: _amountContoller.text,
                    //       planid: widget.savings.id,
                    //       amount: _amountContoller.text,
                    //       autosave: autoSave.value,
                    //       interval: frequency.value,
                    //       target_durations: duration.value,
                    //       target_amount: _targetAmountContoller.text,
                    //       istarget: widget.savings.name!.toLowerCase() ==
                    //               'target savings'
                    //           ? true
                    //           : false,
                    //     )
                    //     .then((value) => isLoading.value = false);
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),
              if (defaultTargetPlatform == TargetPlatform.iOS)
                const SizedBox(
                  height: 15,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
