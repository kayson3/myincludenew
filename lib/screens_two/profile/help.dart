import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/apis/auth.dart';
import 'package:includenew/constants.dart';
import 'package:includenew/widgets/button.dart';
import 'package:includenew/widgets/dialog.dart';
import 'package:includenew/widgets/inputfield.dart';
import 'package:includenew/widgets/text.dart';

class Help extends StatelessWidget {
  Help({super.key});

  final formKey = GlobalKey<FormState>();
  final authController = Get.put(LoginController());
  RxBool isLoading = false.obs;

  final email = TextEditingController();
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgSecColor(),
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Constants.btnColor(),
                            )),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Constants.btnColor(),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Help & Support',
                    style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We are sorry for the inconveniences, please gather your  issues and send to admin ',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    // decoration: const InputDecoration(
                    //   border: InputBorder.none,
                    // ),
                    controller: email,
                    validator: Constants.validateEmail,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Constants.btnColor(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Message',
                    style: TextStyle(
                        color: Constants.txtSecColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 163,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.bgSecColor(),
                        border: Border.all(color: Constants.btnColor())),
                    child: TextFormField(
                      maxLines: 7,
                      style: TextStyle(color: Constants.txtSecColor()),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      controller: message,
                      validator: (v) {
                        if (v.toString().isEmpty) {
                          return "Field can't be empty";
                        }
                        return null;
                      },
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
                  Obx(
                    () => Button(
                      buttonText: 'Send',
                      buttonWidth: 134,
                      isLoading: isLoading.value,
                      color: Constants.btnColor(),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          isLoading.value = true;
                          authController
                              .help(email: email.text, message: message.text)
                              .then((value) {
                            isLoading.value = false;
                            if (value) {
                              Get.dialog(SuccessfulDialogs(
                                showloader: false,
                                showclose: true,
                                title: 'Success',
                                description: 'Message sent successfully',
                              ));
                            }
                            return null;
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
