import 'package:accessories_store/Features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/services/cache/cache_helper.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_images.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      final page = pageController.page;
      if (page != null) {
        setState(() {
          currentPage = page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == 1; // Last page (index 1 of 2 pages)

    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 50.h),
          child: CustomButtonWidget(
            buttonColor: isLastPage
                ? AppColors.primaryColor
                : AppColors.blueColor,
            buttonHeight: 46.h,
            buttonWidth: 343.w,
            borderRadiusButton: 12.r,
            borderSideColor: isLastPage
                ? AppColors.primaryColor
                : AppColors.blueColor,
            prefixSvgIcon: isLastPage ? null : Assets.imagesSvgIconNext,
            onPressed: () async {
              HapticFeedback.lightImpact();

              if (isLastPage) {
                // Mark onboarding as completed
                await CacheHelper.setBool(
                  CacheHelper.kIsOnBoardingViewSeen,
                  true,
                );

                if (context.mounted) {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutes.registerScreen);
                }
              } else {
                // Go to next page
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            title: isLastPage
                ? LocaleKeys.get_started.tr()
                : LocaleKeys.next.tr(),
            titleStyle: isLastPage
                ? AppTextStyle.whiteW700S16
                : AppTextStyle.whiteW700S16,
          ),
        ),
      ],
    );
  }
}
