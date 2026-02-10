import 'package:accessories_store/Features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: const OnBoardingViewBody(),
    );
  }
}
