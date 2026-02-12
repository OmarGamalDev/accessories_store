import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinWidgetCode extends StatelessWidget {
  const PinWidgetCode({super.key, required this.otpController, this.onChanged});
  final TextEditingController otpController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5.r),
              fieldHeight: 60.h,
              fieldWidth: 40.w,
              activeFillColor: AppColors.whiteColor,
              activeColor: AppColors.primaryColor,
              inactiveFillColor: AppColors.borderTextFieldColor,
              inactiveColor: AppColors.greyColor,
              selectedFillColor: AppColors.whiteColor,
              selectedColor: AppColors.primaryColor,
            ),
            cursorColor: AppColors.primaryColor,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            controller: otpController,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            // validator: (value) {
            //   return Validators.validateOtp(value);
            // },
          );
  }
}