import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilies/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.color, this.strokeWidth, this.strokeAlign});
  final Color? color;
  final double? strokeWidth;
  final double? strokeAlign;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primaryColor,
        strokeWidth: strokeWidth?.w ?? 4.w,
        strokeAlign: strokeAlign,
      ),
    );
  }
}
