import 'package:accessories_store/core/services/input_validator.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_text_field_widget.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/features/auth/forgot_password/presentation/view/widgets/forgot_password_button.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key, required this.email});
  final String email;
  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = widget.email;
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
            children: [
              CustomHeightSpacingWidget(height: 24),
              Text(LocaleKeys.forgetPass3.tr(),style: AppTextStyle.greyW600S16,),
              CustomHeightSpacingWidget(height: 31),
              CustomTextFieldWidget(
                controller: emailController,
                hintText: LocaleKeys.email.tr(),
                prefixIcon: Icons.email_outlined,
                validator: (v){
                  return Validators.validateEmail(v);
                },
              ),
              CustomHeightSpacingWidget(height: 30),
              ForgotPasswordButton(
                formKey: formKey,
                emailController: emailController,
              )
            ],
          ),
      ),
    );
  }
}