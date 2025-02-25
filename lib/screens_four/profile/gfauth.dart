// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toast/toast.dart';

import '../../apis/auth.dart';
import '../../widgets/button.dart';

class GFAuth extends StatelessWidget {
  GFAuth({super.key, required this.val});

  final bool val;
  final RxBool _isLoading = false.obs;
  final RxString kinCondition = "If no transaction debit".obs;
  final List kinConditionList = ["If no transaction debit"];
  final RxInt selectedDuration = 1.obs;
  final RxInt percentageAllot = 1.obs;
  TextEditingController pinController = TextEditingController();
  // TextEditingController phoneNumberController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  final List kindurationList = ["Days", "Months", "Years"];
  final RxString kinduration = "Days".obs;

  RxInt step = 1.obs;
  final auth = Get.put(LoginController());
  // final Nfccontroller nfccontroller = Get.put(Nfccontroller());
  // final GlobalController globalcontroller = Get.put(GlobalController());
  final TextEditingController codeContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => step.value == 1
        ? SizedBox(
            height: 600,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(33))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 700,
                          child: Column(children: [
                            Container(
                              height: 5,
                              width: 93,
                              decoration: const BoxDecoration(
                                  color: Color(0xff9DA3B1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text('Google Factor Authentication',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff0B112F))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                  'Follow the steps below to set up 2FA with google authentication app to keep your account safe',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.4,
                                      fontSize: 13.74,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff525869))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45),
                                child: Text('Step 1',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 13.74,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff525869))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45),
                                child: Text(
                                    'Install Google authentication app on your phone',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 13.74,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff525869))),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45),
                                child: Text('Step 2',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 13.74,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff525869))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45),
                                child: Text(
                                    'Copy and paste your secret key below into the authenticator app and type in the 6 digit OTP you receive from the app. ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 13.74,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff525869))),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // QrImage(
                            //   data: auth.serverResponse['dataUrl'] ?? '',
                            //   size: 20,
                            //   // gapless: false,
                            // ),
                            Image.memory(const Base64Decoder().convert(auth
                                    .serverResponse['dataUrl']
                                    .toString()
                                    .split(',')
                                    .last

                                // ?? ''

                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 5, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: const Color(0xffEBEBEB),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                          auth.serverResponse['secret'] ?? '',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              height: 1.4,
                                              fontSize: 13.74,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff525869))),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text:
                                                auth.serverResponse['secret']));
                                        ToastContext().init(context);
                                        Toast.show("Copied!!",
                                            duration: Toast.lengthShort,
                                            gravity: Toast.center);
                                      },
                                      child: const Text('Copy',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              height: 1.4,
                                              fontSize: 13.74,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff525869))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // const Spacer(),
                            const SizedBox(
                              height: 13,
                            ),
                            Button(
                              isLoading: _isLoading.value,
                              buttonText: 'Continue',
                              color: Constants.bgColor(),
                              textSize: 15,
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2.5,
                              onTap: () {
                                step.value = 2;
                              },
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            height: 450,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(33))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Column(children: [
                        Container(
                          height: 5,
                          width: 93,
                          decoration: const BoxDecoration(
                              color: Color(0xff9DA3B1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text('Google Factor Authentication',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0B112F))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          child: Text(
                              'Enter the code you got from the google authentication application',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.4,
                                  fontSize: 13.74,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff525869))),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        // const Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 45),
                        //     child: Text('Step 1',
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //             height: 1.4,
                        //             fontSize: 13.74,
                        //             fontWeight: FontWeight.w600,
                        //             color: Color(0xff525869))),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 45),
                        //   child: Row(
                        //     children: [
                        //       const Text('OBGTBJ6K9A4.....',
                        //           textAlign: TextAlign.start,
                        //           overflow: TextOverflow.ellipsis,
                        //           style: TextStyle(
                        //               height: 1.4,
                        //               fontSize: 13.74,
                        //               fontWeight: FontWeight.w400,
                        //               color: Color(0xff525869))),
                        //       const Spacer(),
                        //       TextButton(
                        //         onPressed: () async {
                        //           await Clipboard.setData(
                        //               const ClipboardData(text: "OBGTBJ6K9A4"));
                        //           ToastContext().init(context);
                        //           Toast.show("Copied!!",
                        //               duration: Toast.lengthShort,
                        //               gravity: Toast.center);
                        //         },
                        //         child: const Text('Tap to copy',
                        //             textAlign: TextAlign.start,
                        //             style: TextStyle(
                        //                 height: 1.4,
                        //                 fontSize: 13.74,
                        //                 fontWeight: FontWeight.w600,
                        //                 color: Color(0xff525869))),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const Text('Authentication Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 13.74,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff525869))),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: codeContoller,
                            cursorColor: const Color(0xff232D51),
                            // obscureText: seePassword.value,
                            // onChanged: (v) {
                            //   if (v.length < 8) {
                            //     newPassworderrortext.value =
                            //         "password must have between 8 and 100 characters.";
                            //   } else {
                            //     newPassworderrortext.value = '';
                            //   }
                            // },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                label: const Text('',
                                    style: TextStyle(
                                        fontSize: 15.74,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff525869))),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff232D51)),
                                ),
                                suffixIcon: TextButton(
                                  onPressed: () async {
                                    Clipboard.getData('text/plain').then(
                                        (value) =>
                                            codeContoller.text = value!.text!);
                                  },
                                  child: const Text('Paste',
                                      style: TextStyle(
                                          fontSize: 15.74,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff525869))),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff232D51)),
                                ),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff232D51)))),
                          ),
                        ),

                        const SizedBox(
                          height: 60,
                        ),
                        Obx(
                          () => Button(
                            isLoading: _isLoading.value,
                            buttonText: 'Confirm',
                            color: Constants.bgColor(),
                            textSize: 17,
                            buttonWidth:
                                MediaQuery.of(context).size.width / 2.5,
                            onTap: () {
                              if (codeContoller.text.isNotEmpty) {
                                _isLoading.value = true;
                                auth
                                    .enable2fa(code: codeContoller.text)
                                    .then((value) {
                                  Constants.store.write('googleAuth', val);
                                  _isLoading.value = false;
                                  if (value) {
                                    Get.back();
                                    Get.bottomSheet(Success(),
                                        isScrollControlled: true);
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ));
  }
}

class Success extends StatelessWidget {
  Success({super.key});
  final RxBool _isLoading = false.obs;

  final auth = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580,
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(33))),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 93,
                    decoration: const BoxDecoration(
                        color: Color(0xff9DA3B1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  Image.asset(
                    'assets/images/successful.gif',
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                  ),
                  const Text('Setup Successful',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0B112F))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('2FA has been set up on your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 13.74,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff525869))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 180,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(children: [
                      const Text(
                          'This is your recovery code below, copy it and store it somewhere safe. you will need it to recover your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.4,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0B112F))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 209,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(auth.recoverykeys.value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    height: 1.4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff0B112F))),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: auth.recoverykeys.value));
                                ToastContext().init(context);
                                Toast.show("Copied!!",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
                              },
                              child: const Icon(AntDesign.copy1,
                                  color: Color(0xff292D32))),
                          const Spacer(),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
                  Button(
                    isLoading: _isLoading.value,
                    buttonText: 'Done',
                    color: const Color(0xff232D51),
                    textSize: 17,
                    buttonWidth: MediaQuery.of(context).size.width / 2.5,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))),
    );
  }
}
