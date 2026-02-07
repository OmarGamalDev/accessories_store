import 'package:accessories_store/core/utilies/app_colors.dart';
import 'package:accessories_store/core/utilies/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.buttonColor,
    this.title,
    this.titleStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize,
    this.overlayColor,
    this.borderRadiusButton,
    this.borderSideColor,
    this.borderSideWidth,
    this.onPressed, required this.buttonWidth,  this.buttonHeight, this.child,
  });
  final Color? buttonColor;
  final Color? overlayColor;
  final Color? borderSideColor;
  final String? title;
  final TextStyle? titleStyle;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final double? borderRadiusButton;
  final double? borderSideWidth;
  final double buttonWidth;
  final double? buttonHeight;
  final void Function()? onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight?.h ?? 54.h,
      width: buttonWidth.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(buttonColor ?? AppColors.primaryColor),
          overlayColor: WidgetStatePropertyAll(overlayColor ?? AppColors.greyColor.withOpacity(0.5)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadiusButton?.r ?? 16.r,
              ),
              side: BorderSide(
                color: borderSideColor ?? AppColors.primaryColor,
                width: borderSideWidth ?? 1.w,
              ),
            ),
          ),
        ),
        onPressed: (){},
        child: Row(
          children: [
            prefixIcon == null
                ? SizedBox.shrink()
                : Icon(
                    prefixIcon,
                    color: prefixIconColor ?? AppColors.whiteColor,
                    size: prefixIconSize ?? 24.sp,
                  ),
            Expanded(
              child: Center(child: child ?? Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: titleStyle ?? AppTextStyle.whiteW700S16,
              ),),
            ),
            suffixIcon == null
                ? SizedBox.shrink()
                : Icon(
                    suffixIcon,
                    color: suffixIconColor ?? AppColors.whiteColor,
                    size: suffixIconSize ?? 24.sp,
                  ),
          ],
        ),
      ),
    );
  }
}
