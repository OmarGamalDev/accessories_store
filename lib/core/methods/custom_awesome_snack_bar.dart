import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomAwesomeSnackBarWidget {
  static showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.down,
        content: AwesomeSnackbarContent(
          title: LocaleKeys.success,
          message: message,
          contentType: ContentType.success,
        ),
        behavior: SnackBarBehavior.floating, // مهم للتحكم في الهوامش
        backgroundColor: Colors.transparent, // مهم علشان يظهر التصميم الأصلي
        elevation: 0, // optional
        duration: Duration(seconds: 3),
        closeIconColor: AppColors.whiteColor,
      ),
    );
  }

  static showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: LocaleKeys.error,
          message: message,
          contentType: ContentType.failure,
        ),
        behavior: SnackBarBehavior.floating, // مهم للتحكم في الهوامش
        backgroundColor: Colors.transparent, // مهم علشان يظهر التصميم الأصلي
        elevation: 0, // optional
        duration: Duration(seconds: 3),
      ),
    );
  }

  static showWarningSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: LocaleKeys.warning,
          message: message,
          contentType: ContentType.warning,
        ),
        behavior: SnackBarBehavior.floating, // مهم للتحكم في الهوامش
        backgroundColor: Colors.transparent, // مهم علشان يظهر التصميم الأصلي
        elevation: 0, // optional
        duration: Duration(seconds: 3),
      ),
    );
  }

  static showInfoSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: LocaleKeys.info,
          message: message,
          contentType: ContentType.help,
        ),
        behavior: SnackBarBehavior.floating, // مهم للتحكم في الهوامش
        backgroundColor: Colors.transparent, // مهم علشان يظهر التصميم الأصلي
        elevation: 0, // optional
        duration: Duration(seconds: 3),
      ),
    );
  }
}
