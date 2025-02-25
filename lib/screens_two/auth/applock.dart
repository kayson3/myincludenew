import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/screens_two/home.dart';
import 'package:includenew/widgets/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppLock extends StatelessWidget {
  AppLock({super.key});

  RxBool obscurePassword = true.obs;

  TextEditingController pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: whiteColor,F
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
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
                              ? const AssetImage('assets/images/cardtemp2.png')
                              : NetworkImage(Constants.cardImage())
                                  as ImageProvider<Object>,
                          fit: BoxFit.fill,
                          opacity: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   height: 184,
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.symmetric(horizontal: 25),
                      //   decoration: BoxDecoration(
                      //       // color: Colors.amber,
                      //       color: Constants.cardbgColor(),
                      //       borderRadius: BorderRadius.circular(30)),
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20),
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: Constants.storeDesign
                      //                 .read("ACCOUNTDESIGN")['design']['card_image']
                      //                 .toString()
                      //                 .isEmpty
                      //             ? const AssetImage('assets/images/authcard.png')
                      //             : NetworkImage(Constants.store
                      //                     .read("ACCOUNTDESIGN")['design']
                      //                 ['card_image']) as ImageProvider<Object>,
                      //         fit: BoxFit.fill,
                      //         opacity: 0.8,
                      //       ),
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       // mainAxisAlignment: MainAxisAlignment.,
                      //       children: [
                      //         const Spacer(),

                      //         const Spacer(),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Set up App Lock',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Create App lock PIN for your account.',
                            style: TextStyle(
                                color: Constants.txtColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'App Lock PIN',
                            style: TextStyle(
                                color: Constants.txtColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Enter a four digit PIN to set up your app lock',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: SizedBox(
                            width: 200,
                            child: PinCodeTextField(
                              controller: pinController,
                              appContext: context,
                              length: 4,
                              keyboardType: TextInputType.phone,
                              cursorColor: const Color(0xffAEACAC),
                              textStyle:
                                  TextStyle(color: Constants.txtSecColor()),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Please input pin";
                                } else if (v.length < 4) {
                                  return "input 4 digit pin";
                                }
                                return null;
                              },
                              onChanged: (v) {},
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
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         padding: const EdgeInsets.all(10),
                      //         decoration: const BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: Color(0xffE6E7EB),
                      //         ),
                      //         child: Stack(
                      //           alignment: AlignmentDirectional.center,
                      //           children: const [
                      //             Icon(
                      //               MaterialIcons.fingerprint,
                      //               size: 20,
                      //               color: Colors.blueAccent,
                      //             ),
                      //             Icon(MaterialCommunityIcons.scan_helper),
                      //           ],
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 15,
                      //       ),
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: const [
                      //           Text(
                      //             'Biometric',
                      //             style: TextStyle(
                      //                 color: Constants.txtSecColor(),
                      //                 fontWeight: FontWeight.w700,
                      //                 fontSize: 15),
                      //           ),
                      //           Text(
                      //             'Turn on your phone biometric',
                      //             style: TextStyle(
                      //                 color: Color(0xff8B8B8B),
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 12),
                      //           ),
                      //         ],
                      //       ),
                      //       const Spacer(),
                      //       Transform.scale(
                      //         scale: 0.6,
                      //         child: CupertinoSwitch(
                      //             thumbColor: const Color(0xff232D51),
                      //             trackColor: const Color(0xffD9D9D9),
                      //             value: false,
                      //             onChanged: (v) {}),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Button(
                            buttonText: 'Complete',
                            buttonWidth: MediaQuery.sizeOf(context).width,
                            color: Constants.btnColor(),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Constants.store
                                    .write("PIN", pinController.text);
                                Get.to(() => Home());
                              }
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
