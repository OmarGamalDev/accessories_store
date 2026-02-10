import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../utils/app_text_style.dart';
import 'custom_button_widget.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: AppTextStyle.blackW700S16),
          const CustomHeightSpacingWidget(height: 15),
          CustomButtonWidget(
            prefixIcon: Icons.restart_alt,
            onPressed: onPressed,
            title: LocaleKeys.reload,
            buttonColor: AppColors.primaryColor,
            borderSideColor: AppColors.primaryColor,
            buttonWidth: 200,
            buttonHeight: 50,
            borderRadiusButton: 35,
          ),
        ],
      ),
    );
  }
}
