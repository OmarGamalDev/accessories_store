import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.forgotPasswordScreen,extra: email);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          LocaleKeys.forgotPassword.tr(),
          style: AppTextStyle.primaryW700S13lightGreenColor,
        ),
      ),
    );
  }
}
