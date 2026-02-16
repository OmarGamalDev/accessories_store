import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/app_images.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.search, color: AppColors.primaryColor, size: 25.sp),
                CustomWidthSpacingWidget(width: 16),
                Text(
                  "${LocaleKeys.searchAbout.tr()}.......",
                  style: AppTextStyle.greyW400S13,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imagesSvgSetting,width: 20.w,height: 20.h,),
        ),
      ],
    );
  }
}
