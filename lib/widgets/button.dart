// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

// import '../colors.dart';

class Button extends StatelessWidget {
  Function()? onTap;
  String buttonText;
  double buttonWidth;
  Color? color;
  Color? loderColor;
  double? textSize;
  double? height;
  EdgeInsetsGeometry? padding;
  bool isLoading;
  BoxBorder? border;
  double radius;
  Color? textColor;

  Button(
      {super.key,
      this.onTap,
      this.buttonText = '',
      this.buttonWidth = 240,
      this.textSize,
      this.color,
      this.padding,
      this.isLoading = false,
      this.border,
      this.radius = 5.6,
      this.textColor,
      this.loderColor,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 25),
        height: height ?? 50,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: color ?? Constants.btnColor(),
          borderRadius: BorderRadius.circular(radius),
          border: border,
        ),
        child: isLoading == true
            ? SizedBox(
                height: 10,
                width: 10,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loderColor ?? Colors.white,
                  ),
                ),
              )
            : Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor ?? Constants.btnSecColor(),
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  Function()? onTap;
  String buttonText;
  double buttonWidth;
  Color? color;
  Color? loderColor;
  double? textSize;
  double? height;
  EdgeInsetsGeometry? padding;
  bool isLoading;
  BoxBorder? border;
  double radius;
  Color? textColor;
  Widget? child;

  CircleButton({
    super.key,
    this.onTap,
    this.buttonText = '',
    this.buttonWidth = 240,
    this.textSize,
    this.color,
    this.padding,
    this.isLoading = false,
    this.border,
    this.radius = 5.6,
    this.textColor,
    this.loderColor,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 25),
        height: height ?? 50,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: color ?? darkColor,
          // borderRadius: BorderRadius.circular(radius),
          shape: BoxShape.circle,
          border: border,
        ),
        child: isLoading == true
            ? SizedBox(
                height: 10,
                width: 10,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loderColor ?? Colors.white,
                  ),
                ),
              )
            : child ??
                Center(
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor ?? Constants.btnSecColor(),
                        fontSize: textSize ?? 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
      ),
    );
  }
}
