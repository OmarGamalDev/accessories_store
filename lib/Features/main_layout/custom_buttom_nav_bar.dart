import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_images.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomButtomNavBar extends StatefulWidget {
  final ValueChanged<int> onTap;
  const CustomButtomNavBar({super.key, required this.onTap});

  @override
  State<CustomButtomNavBar> createState() => _CustomButtomNavBarState();
}

class _CustomButtomNavBarState extends State<CustomButtomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.08),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, -4),
          ),
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.04),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        unselectedItemColor: const Color(0xff4E5556),
        selectedItemColor: AppColors.primaryColor,
        itemPadding: Localizations.localeOf(context).languageCode == 'ar'
            ? const EdgeInsets.only(top: 0, left: 15)
            : const EdgeInsets.only(top: 0, right: 15),
        currentIndex: currentIndex,
        onTap: (i) {
          currentIndex = i;
          widget.onTap(i);
          setState(() {});
        },
        items: [
          navBarItem(
            title: LocaleKeys.home.tr(),
            inActiveIcon: Assets.imagesSvgHome,
            activeIcon: Assets.imagesSvgHomeFilled,
          ),
          navBarItem(
            title: LocaleKeys.categories.tr(),
            inActiveIcon: Assets.imagesSvgProducts,
            activeIcon: Assets.imagesSvgProductsFilled,
          ),
          navBarItem(
            title: LocaleKeys.cart.tr(),
            inActiveIcon: Assets.imagesSvgShoppingCart,
            activeIcon: Assets.imagesSvgShoppingCartFilled,
          ),
          navBarItem(
            title: LocaleKeys.profile.tr(),
            inActiveIcon: Assets.imagesSvgUser,
            activeIcon: Assets.imagesSvgUserFilled,
          ),
        ],
      ),
    );
  }

  SalomonBottomBarItem navBarItem({
    required String title,
    required String inActiveIcon,
    required String activeIcon,
  }) {
    return SalomonBottomBarItem(
      icon: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .1,
        child: Stack(
          clipBehavior: Clip.none,
          children: [Center(child: SvgPicture.asset(inActiveIcon, height: 22))],
        ),
      ),
      activeIcon: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 20,
        child: SvgPicture.asset(activeIcon, height: 22),
      ),
      title: Text("   $title"),
    );
  }
}
