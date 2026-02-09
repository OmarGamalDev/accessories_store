import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/services/cache/cache_helper.dart';
import 'package:accessories_store/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    setupAnimations();
    executeNavigation();
  }

  void setupAnimations() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.65, curve: Curves.easeIn),
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOutBack),
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Opacity(
                opacity: fadeAnimation.value,
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(
                Assets.imagesPngAccessoriesStoreLogo,
                width: 300.w,
                height: 300.h,
              ),
            ),
          ),
        ),

        // Bottom decoration
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            Assets.imagesSvgCircles,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      final bool isOnBoardingCompleted = CacheHelper.isOnBoardingCompleted;
      if (isOnBoardingCompleted) {
        final bool isLoggedIn = CacheHelper.isLoggedIn;

        if (isLoggedIn) {
          GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
        }
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.onboardingScreen);
      }
    });
  }
}
