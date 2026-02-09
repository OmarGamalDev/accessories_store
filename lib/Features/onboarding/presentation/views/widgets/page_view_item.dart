import 'package:accessories_store/Features/onboarding/presentation/views/widgets/skip_button_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.pageController,
  });

  final String image;
  final String title, subtitle;
  final PageController pageController;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            SizedBox(height: 14.h),
            const SkipButtonWidget(),
            SizedBox(height: 50.h),

            // Image with animation
            FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Image.asset(
                  widget.image,
                  width: 300.w,
                  height: 300.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            // Page Indicator (2 dots only)
            SmoothPageIndicator(
              controller: widget.pageController,
              count: 2, // Changed from 4 to 2
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.greyColor.withValues(alpha: 0.3),
                dotHeight: 10.h,
                dotWidth: 10.w,
                spacing: 8.w,
                expansionFactor: 3,
              ),
              onDotClicked: (index) {
                HapticFeedback.selectionClick();
                widget.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),

            SizedBox(height: 37.h),

            // Title
            Text(
              widget.title,
              style: AppTextStyle.blackW700S23,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 11.h),

            // Subtitle
            Text(
              widget.subtitle,
              style: AppTextStyle.greyW600S16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
