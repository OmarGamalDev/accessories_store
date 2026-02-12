import 'package:accessories_store/core/services/input_validator.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_text_field_widget.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/features/auth/new_password/presentation/view/widgets/reset_password_button.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key, required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeightSpacingWidget(height: 24),
              Text(LocaleKeys.newPassBody.tr(), style: AppTextStyle.blackW600S16),
              CustomHeightSpacingWidget(height: 34),
              CustomTextFieldWidget(
                controller: passwordController,
                hintText: LocaleKeys.password,
                validator: (v){
                  return Validators.validatePassword(v);
                },
              ),
              CustomHeightSpacingWidget(height: 24),
              CustomTextFieldWidget(
                controller: confirmPasswordController,
                hintText: LocaleKeys.confirmPass.tr(),
                validator: (v){
                  return Validators.validateRetypePassword(v,passwordController.text.trim());
                },
              ),
              CustomHeightSpacingWidget(height: 24),
              ResetPasswordButton(passwordController: passwordController, email: widget.email, otp: widget.otp,formKey: formKey,),
            ],
          ),
        ),
      ),
    );
  }
}
