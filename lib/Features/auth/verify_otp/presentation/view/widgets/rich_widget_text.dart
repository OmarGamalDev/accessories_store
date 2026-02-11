import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RichWidgetText extends StatelessWidget {
  const RichWidgetText({super.key, required this.text, this.secondText});
  final String text;
  final String? secondText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppTextStyle.greyW600S16,
        children: <TextSpan>[
          TextSpan(
            text: secondText ?? "",
            style: GoogleFonts.cairo(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
