import 'package:e_commerce_app/core/utilities/app_colors.dart';
import 'package:e_commerce_app/core/utilities/app_text_style.dart';
import 'package:e_commerce_app/core/utilities/app_texts.dart';
import 'package:e_commerce_app/core/widgets/custom_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
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
          Text(
            text,
            style: AppTextStyle.blackW500Size16ReadexPro,
          ),
          const HeightSpacing(height: 15),
          CustomButtonWidget(
            iconLeft: Icons.restart_alt,
            onPressed: onPressed,
              title: AppTexts.reload,
              buttonColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              width: 140,
              height: 60,
              borderRadius: 35,
              textStyle: AppTextStyle.whiteW500Size14
          )
        ],
      ),
    );
  }
}
