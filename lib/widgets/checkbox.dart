// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CheckBoxx extends StatelessWidget {
  CheckBoxx({Key? key}) : super(key: key);

  RxBool checked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        activeColor: const Color(0xff6B4EFF),
        onChanged: (bool? value) {
          checked.value = value!;
        },
        value: checked.value,
      ),
    );
  }
}
