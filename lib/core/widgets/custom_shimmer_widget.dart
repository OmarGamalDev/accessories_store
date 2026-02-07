import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../utilies/app_colors.dart';

class CustomShimmerContainerWidget extends StatelessWidget {
  const CustomShimmerContainerWidget({super.key, required this.height, required this.width, required this.radius});
  final double height ;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.4),
      highlightColor: Colors.white,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );
  }
}
