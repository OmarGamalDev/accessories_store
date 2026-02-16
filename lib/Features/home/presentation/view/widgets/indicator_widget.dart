import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/home/data/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: banners.length,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.primaryColor,
        dotColor: AppColors.greyColor.withValues(alpha: 0.3),
        dotHeight: 8.h,
        dotWidth: 8.w,
        spacing: 6.w,
        expansionFactor: 2.5,
      ),
      // onDotClicked: (index) {
      //   HapticFeedback.selectionClick();
      //   widget.pageController.animateToPage(
      //     index,
      //     duration: const Duration(milliseconds: 300),
      //     curve: Curves.easeInOut,
      //   );
      // },
    );
  }
}
