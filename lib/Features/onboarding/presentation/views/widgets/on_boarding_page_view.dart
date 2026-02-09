import 'package:accessories_store/Features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:accessories_store/core/utils/app_images.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          pageController: pageController,
          image: Assets.imagesPngAccessoriesStoreLogo,
          title: LocaleKeys.land1Title.tr(),
          subtitle: LocaleKeys.land1SubTitle.tr(),
        ),
        PageViewItem(
          pageController: pageController,
          image: Assets.imagesPngAccessoriesStoreLogo,
          title: LocaleKeys.land2Title.tr(),
          subtitle: LocaleKeys.land2SubTitle.tr(),
        ),
      ],
    );
  }
}
