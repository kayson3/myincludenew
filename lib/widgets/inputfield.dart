import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final bool obscurePassword;
  final Widget? suffixIcon;
  final double? radius;
  final Color? filledColor;
  final Color? borderColor;
  final bool? readonly;
  final bool? isdense;
  final Function()? onTap;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? maxLength;
  final InputBorder? border;
  final bool isPassword;

  TextInputField(
      {super.key,
      this.hintText = '',
      this.obscurePassword = false,
      this.suffixIcon,
      this.radius,
      this.filledColor,
      this.borderColor,
      this.readonly,
      this.onTap,
      this.isdense,
      this.onChanged,
      this.prefixIcon,
      this.contentPadding,
      this.validator,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.textStyle,
      this.border,
      this.isPassword = false,
      this.controller});

  RxBool showPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: filledColor, borderRadius: BorderRadius.circular(radius ?? 0)),
      child: Obx(
        () {
          //do not remove this bellow
          //it is there so that getx wont show exception
          showPassword.value;
          return TextFormField(
            onTap: onTap,
            // key: key,

            readOnly: readonly ?? false,
            cursorColor: const Color(0xffAEACAC),
            onChanged: onChanged,
            obscureText: isPassword ? showPassword.value : obscurePassword,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            style: textStyle ?? TextStyle(color: Constants.txtSecColor()),
            textInputAction: TextInputAction.done,
            maxLines: isPassword || obscurePassword ? 1 : maxLines,
            maxLength: maxLength,
            decoration: InputDecoration(
                contentPadding: contentPadding,
                isDense: isdense,
                errorMaxLines: 3,
                hintText: hintText,
                prefixIcon: prefixIcon,
                prefixIconColor: const Color(0xffBEC1CD),
                suffixIcon: isPassword
                    ? GestureDetector(
                        onTap: () {
                          showPassword.value = !showPassword.value;
                        },
                        child: Icon(
                          showPassword.value
                              ? Entypo.eye_with_line
                              : Entypo.eye,
                          color: Constants.txtSecColor(),
                        ))
                    : suffixIcon,
                suffixIconColor: Constants.txtSecColor(),
                hintStyle: TextStyle(
                    color: Constants.txtColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                focusedBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5,
                            color: borderColor ?? Constants.txtColor()!),
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius ?? 5.6),
                        )),
                enabledBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5,
                            color: borderColor ?? Constants.txtColor()!),
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius ?? 5.6),
                        )),
                border: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5,
                            color: borderColor ?? Constants.txtColor()!),
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius ?? 5.6), //C3C7E5
                        ))),
          );
        },
      ),
    );
  }
}
