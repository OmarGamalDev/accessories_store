import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowBackWidget extends StatelessWidget {
  const CustomArrowBackWidget({
    super.key,
    this.cicleRadius,
    this.circleColor,
    this.onPressed,
    this.circleWidth,
    this.cicleHeight,
    this.toolTip,
  });
  final double? cicleRadius;
  final double? circleWidth;
  final double? cicleHeight;
  final Color? circleColor;
  final String? toolTip;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w),
      alignment: Alignment.center,
      width: circleWidth ?? 100.w,
      height: cicleHeight ?? 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor ?? AppColors.whiteColor,
        border: BoxBorder.all(width: 1, color: AppColors.grey2Color),
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.all(0),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          tooltip: toolTip ?? "",
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
