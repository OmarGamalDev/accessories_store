import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilies/app_colors.dart';
import '../utilies/app_text_style.dart';
class CustomShowSnackBar{
  static void customShowSnackBar(
      {
        required BuildContext context,
        required String message,
        required Color colorSnackBar,
        required IconData icon,
        required AnimatedSnackBarType type
      }
      )
  {
    AnimatedSnackBar(
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      mobilePositionSettings:  MobilePositionSettings(bottomOnAppearance: 20.w),
      animationCurve: Curves.easeOutBack,
      builder: ((context) {
        return  MaterialAnimatedSnackBar(
          foregroundColor: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          iconData: icon,
          messageTextStyle: AppTextStyle.whiteW700S16,
          messageText:message,
          type: type,
        );
      }),
    ).show(context);
  }
}