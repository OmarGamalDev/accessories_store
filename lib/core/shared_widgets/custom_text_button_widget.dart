import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({super.key, this.title, this.textStyle, this.onPressed, this.overlayColor, this.child});
  final String? title;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final Color? overlayColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                animationDuration: Duration(milliseconds: 300),
                overlayColor: WidgetStatePropertyAll(overlayColor ?? Colors.transparent),
              ),
              onPressed: onPressed,
              child: child ?? Text(
              title??"",
              style:  textStyle?? AppTextStyle.primaryW600S16lightGreenColor,
            ),
            );
  }
}