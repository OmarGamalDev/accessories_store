import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/services/cache/cache_helper.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async {
            HapticFeedback.lightImpact();
            await CacheHelper.setBool(CacheHelper.kIsOnBoardingViewSeen, true);

            if (context.mounted) {
              GoRouter.of(context).pushReplacement(AppRoutes.registerScreen);
            }
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(LocaleKeys.skip.tr(), style: AppTextStyle.greyW600S16),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
