import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, this.title, this.backgroundColor, this.leading, this.actions});
  final String? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: actions,
        leading: leading,
        scrolledUnderElevation: 0,
        automaticallyImplyActions: false,
        centerTitle: true,
        title: Text(
          title??"",
          style: AppTextStyle.blackW700S19,
        ),
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
      ),
    );
  }
}