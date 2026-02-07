import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';

class CustomShimmerContainerWidget extends StatelessWidget {
  const CustomShimmerContainerWidget({super.key, required this.height, required this.width, required this.radius});
  final double height ;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }
}
