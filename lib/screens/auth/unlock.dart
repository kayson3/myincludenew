import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:includenew/screens/auth/login.dart';
import 'package:includenew/screens/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants.dart';

class Unlock extends StatelessWidget {
  Unlock({super.key});

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: whiteColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 184,
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
                        image: Constants.cardImage().isEmpty
                            ? const AssetImage('assets/images/authcard.png')
                            : NetworkImage(Constants.cardImage())
                                as ImageProvider<Object>,
                        fit: BoxFit.fill,
                        opacity: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'App lock',
                        style: TextStyle(
                            color: Constants.cardTextColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Please enter the 4-digit Applock code setup on login',
                      style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  child: PinCodeTextField(
                    controller: pinController,
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.phone,
                    cursorColor: const Color(0xffAEACAC),
                    textStyle: TextStyle(color: Constants.txtSecColor()),
                    onChanged: (v) {},
                    onCompleted: (v) {
                      if (v.toString() == Constants.store.read("PIN")) {
                        Get.to(() => Home());
                      } else {
                        Fluttertoast.showToast(
                            msg: "Incorrect PIN",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            // backgroundColor: Colors.red,
                            // textColor: Colors.white,
                            fontSize: 14.0);
                      }
                    },
                    pinTheme: PinTheme(
                      borderRadius: BorderRadius.circular(6),
                      shape: PinCodeFieldShape.box,
                      selectedColor: const Color(0xffAEACAC),
                      inactiveColor: const Color(0xffAEACAC),
                      selectedFillColor: const Color(0xffAEACAC),
                      inactiveFillColor: const Color(0xffAEACAC),
                      activeColor: const Color(0xffAEACAC),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot PIN? ',
                        style: TextStyle(
                            color: Constants.txtColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Constants.store.erase();
                          Get.offAll(Login());
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Constants.btnColor(),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //     child: Button(
                //       buttonText: 'Complete',
                //       buttonWidth: 134,
                //       color: Constants.btnColor(),
                //       onTap: () {
                //         if (pinController.text == Constants.store.read("PIN")) {
                //           Get.to(() => Home());
                //         } else {
                //           Fluttertoast.showToast(
                //               msg: "Incorrect PIN",
                //               toastLength: Toast.LENGTH_LONG,
                //               gravity: ToastGravity.CENTER,
                //               timeInSecForIosWeb: 1,
                //               // backgroundColor: Colors.red,
                //               // textColor: Colors.white,
                //               fontSize: 14.0);
                //         }
                //       },
                //     ),
                //   ),
                // ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
