import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.dontHaveAccount1.tr(), style: AppTextStyle.greyW600S16),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.registerScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            LocaleKeys.dontHaveAccount2.tr(),
            style: AppTextStyle.primaryW600S16,
          ),
        ),
      ],
    );
  }
}
