import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// Enum to define SnackBar position
enum SnackBarPosition { top, bottom }

class AppSnackBar {
  AppSnackBar._(); // Private constructor

  static void showSuccess({
    required BuildContext context,
    String title = '',
    String message = '',
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    showSnackBar(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.success,
      position: position,
    );
  }

  static void showError({
    required BuildContext context,
    String title = '',
    String message = '',
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    showSnackBar(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.failure,
      position: position,
    );
  }

  static void showWarning({
    required BuildContext context,
    String title = '',
    String message = '',
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    showSnackBar(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.warning,
      position: position,
    );
  }

  static void showInfo({
    required BuildContext context,
    String title = '',
    String message = '',
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    showSnackBar(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.help,
      position: position,
    );
  }

  static void showSuccessBanner({
    required BuildContext context,
    String title = '',
    String message = '',
  }) {
    showMaterialBanner(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.success,
    );
  }

  static void showErrorBanner({
    required BuildContext context,
    String title = '',
    String message = '',
  }) {
    showMaterialBanner(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.failure,
    );
  }

  static void showWarningBanner({
    required BuildContext context,
    String title = '',
    String message = '',
  }) {
    showMaterialBanner(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.warning,
    );
  }

  static void showInfoBanner({
    required BuildContext context,
    String title = '',
    String message = '',
  }) {
    showMaterialBanner(
      context: context,
      title: title,
      message: message,
      contentType: ContentType.help,
    );
  }

  static void showSnackBar({
    required BuildContext context,
    String title = '',
    String message = '',
    required ContentType contentType,
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      margin: position == SnackBarPosition.top
          ? EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150,
              left: 10,
              right: 10,
            )
          : const EdgeInsets.all(10),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showMaterialBanner({
    required BuildContext context,
    String title = '',
    String message = '',
    required ContentType contentType,
  }) {
    final materialBanner = MaterialBanner(
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void hideBanner(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  }
}
