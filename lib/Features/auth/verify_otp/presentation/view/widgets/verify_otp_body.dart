import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/widgets/pin_widget_code.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/widgets/resend_otp_button.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/widgets/rich_widget_text.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/widgets/verify_otp_button.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOtpBody extends StatefulWidget {
  const VerifyOtpBody({super.key, required this.email});
  final String email;

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  final TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomHeightSpacingWidget(height: 24),
            RichWidgetText(
              text: LocaleKeys.verifyBody.tr(),
              secondText: widget.email,
            ),
            CustomHeightSpacingWidget(height: 30),
            PinWidgetCode(
              otpController: otpController,
              onChanged: (v) {
                setState(() {});
              },
            ),
            CustomHeightSpacingWidget(height: 26),
            VerifyOtpButton(
              email: widget.email,
              otpController: otpController,
              formKey: formKey,
            ),
            CustomHeightSpacingWidget(height: 24),
            ResendOtpButton(email: widget.email),
          ],
        ),
      ),
    );
  }
}
