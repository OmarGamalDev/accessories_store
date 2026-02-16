import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/app_images.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  bool isPressed = false;

  void onTapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void onTapUp(TapUpDetails details) {
    setState(() {
      isPressed = false;
    });
  }

  void onTapCancel() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: () {
        
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isPressed
                ? AppColors.greyColor.withValues(alpha: 0.8)
                : AppColors.greyColor,
            width: 1.5.w,
          ),
        ),
        child: Transform.scale(
          scale: isPressed ? 0.98 : 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomWidthSpacingWidget(width: 18),
              SvgPicture.asset(
                Assets.imagesSvgGoogle,
                height: 24.h,
                width: 24.w,
              ),
              const CustomWidthSpacingWidget(width: 80),
              Text(LocaleKeys.google.tr(), style: AppTextStyle.blackW600S16),
            ],
          ),
        ),
      ),
    );
  }
}
