import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 24.r, right: 24.r),
            child: Divider(color: AppColors.greyColor),
          ),
        ),
        Text(
          LocaleKeys.or.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.blackW700S18,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 24.r, left: 24.r),
            child: Divider(color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}
