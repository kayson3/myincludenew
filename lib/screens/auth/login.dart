import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/screens/auth/applock.dart';
import 'package:includenew/screens/auth/forgotpassword.dart';
import 'package:includenew/screens/auth/signup.dart';
import 'package:includenew/screens/auth/verify.dart';
// import 'package:includenew/screens/signup.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/inputfield.dart';

import '../../apis/auth.dart';
import '../../constants.dart';
import '../../widgets/text.dart';

class Login extends StatelessWidget {
  Login({super.key});
  RxBool obscurePassword = true.obs;

  final authController = Get.put(LoginController());

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordControllr = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Obx(
                () => Column(
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
                            image: Constants.cardImage().toString().isEmpty
                                ? const AssetImage('assets/images/authcard.png')
                                : NetworkImage(Constants.cardImage())
                                    as ImageProvider<Object>,
                            fit: BoxFit.fill,
                            opacity: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            const Spacer(),
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'login  your account now, get access to different financial services',
                              style: TextStyle(
                                  color: Constants.cardTextColor(),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Phone',
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextInputField(
                        hintText: 'e.g +2348140230567',
                        keyboardType: TextInputType.phone,
                        controller: phonecontroller,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('+')) {
                            return 'field must contain "+234"';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: Constants.txtColor(),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Obx(
                        () => TextInputField(
                          hintText: 'e.g *********',
                          obscurePassword: obscurePassword.value,
                          validator: (value) {
                            return Constants.validatePassword(value);
                          },
                          controller: passwordControllr,
                          suffixIcon: IconButton(
                            onPressed: () {
                              obscurePassword.value = !obscurePassword.value;
                            },
                            icon: obscurePassword.value
                                ? Icon(
                                    Feather.eye_off,
                                    color: Constants.txtSecColor(),
                                  )
                                : Icon(
                                    Feather.eye,
                                    color: Constants.txtSecColor(),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    if (authController.errorMessage.value.isNotEmpty)
                      const SizedBox(
                        height: 5,
                      ),
                    if (authController.errorMessage.value.isNotEmpty)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: CustomText(
                            text: authController.errorMessage.value,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Obx(
                          () => Button(
                              buttonText: 'Login',
                              buttonWidth: 134,
                              // onTap: () => Get.to(() => Home(),

                              isLoading: isLoading.value,
                              color: Constants.btnColor(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  authController
                                      .login(
                                    password: passwordControllr.text,
                                    phone: phonecontroller.text,
                                  )
                                      .then((value) {
                                    isLoading.value = false;
                                    if (authController.errorMessage.value ==
                                        "Please verify your account to proceed") {
                                      Get.to(() => Verify());
                                    }
                                    if (value) {
                                      //  return Get.to(() => FacialC());
                                      // Get.to(() => Home());

                                      if (Constants.store.read("googleAuth") ==
                                          true) {
                                        Get.to(() => Verify(
                                              is2fa: true,
                                            ));
                                      } else {
                                        Get.to(() => AppLock());
                                      }

                                      // return Get.to(() => FacialC());
                                    }
                                    return null;
                                  });
                                }
                              }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text(
                            'Forgot Password? ',
                            style: TextStyle(
                                color: Constants.txtSecColor(),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  color: Constants.btnColor(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                          color: Constants.txtSecColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => SignUp());
                      },
                      child: Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Constants.btnColor(), width: 2)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Constants.btnSecColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
