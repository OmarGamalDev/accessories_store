import 'package:accessories_store/core/utilies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, this.dividerColor, this.thickness, this.indent, this.endIndent, this.radius});
  final Color? dividerColor;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: dividerColor ?? AppColors.primaryColor,
      thickness: thickness?.w ?? 1.w,
      indent: indent?.w,
      endIndent: endIndent?.w,
      radius: BorderRadius.circular(radius??0),
    );
  }
}
