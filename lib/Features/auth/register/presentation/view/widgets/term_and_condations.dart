import 'package:accessories_store/core/methods/app_snack_bar.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermAndCondations extends StatefulWidget {
  const TermAndCondations({super.key, this.onChanged});

  final ValueChanged<bool>? onChanged;

  @override
  State<TermAndCondations> createState() => _TermAndCondationsState();
}

class _TermAndCondationsState extends State<TermAndCondations> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
            value: isAccepted,
            activeColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(
              color: isAccepted
                  ? AppColors.primaryColor
                  : AppColors.greyColor.withValues(alpha: 0.4),
              width: 1.5.w,
            ),
            onChanged: (value) {
              setState(() {
                isAccepted = value ?? false;
              });
              widget.onChanged?.call(isAccepted);
            },
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${LocaleKeys.termCon1.tr()} ',
                    style: AppTextStyle.greyW700S13,
                  ),
                  TextSpan(
                    text: LocaleKeys.termCon2.tr(),
                    style: AppTextStyle.primaryW700S13lightGreenColor.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navigateToTerms(context);
                      },
                  ),
                  TextSpan(
                    text: ' ${LocaleKeys.termCon3.tr()}',
                    style: AppTextStyle.primaryW700S13lightGreenColor.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navigateToTerms(context);
                      },
                  ),
                ],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  void navigateToTerms(BuildContext context) {
    AppSnackBar.showInfo(
      message: LocaleKeys.termCon4.tr(),
      context: context,
      title: LocaleKeys.termCon2.tr(),
      position: SnackBarPosition.bottom,
    );
  }
}
