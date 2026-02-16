import 'package:accessories_store/core/services/cache/jwt_helper.dart';
import 'package:accessories_store/core/services/cache/secure_storage_helper.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/app_images.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String userName = 'Guest';

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    final token = await SecureStorageHelper().getAccessToken();
    if (token != null) {
      final name = JwtHelper.getUserName(token);
      if (name != null && name.isNotEmpty) {
        setState(() {
          userName = name;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesPngProfileImage, width: 45.w, height: 45.h),
        CustomWidthSpacingWidget(width: 11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.homeHello.tr(), style: AppTextStyle.greyW600S13),
            CustomHeightSpacingWidget(height: 2),
            Text(userName, style: AppTextStyle.blackW700S16),
          ],
        ),
        const Spacer(),
        Container(
          height: 42.h,
          width: 42.w,
          decoration: BoxDecoration(
            color: AppColors.greyColorLight,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesSvgNotification,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }
}
