import 'package:accessories_store/Features/auth/register/presentation/view/widgets/already_have_account.dart';
import 'package:accessories_store/Features/auth/register/presentation/view/widgets/term_and_condations.dart';
import 'package:accessories_store/core/services/input_validator.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_text_field_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isTermsAccepted = false;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomHeightSpacingWidget(height: 20),
                Text(LocaleKeys.signUp.tr(), style: AppTextStyle.blackW700S19),
                const CustomHeightSpacingWidget(height: 24),
                CustomTextFieldWidget(
                  controller: nameController,
                  hintText: LocaleKeys.fullName.tr(),
                  fillColor: AppColors.textFieldColor,
                  hintTextStyle: AppTextStyle.greyW600S13,
                  prefixIcon: Icons.person_outline,
                  prefixColor: AppColors.greyColor,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateName,
                ),
                const CustomHeightSpacingWidget(height: 16),
                CustomTextFieldWidget(
                  controller: emailController,
                  hintText: LocaleKeys.email.tr(),
                  fillColor: AppColors.textFieldColor,
                  hintTextStyle: AppTextStyle.greyW600S13,
                  prefixIcon: Icons.email_outlined,
                  prefixColor: AppColors.greyColor,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const CustomHeightSpacingWidget(height: 16),
                CustomTextFieldWidget(
                  controller: passwordController,
                  hintText: LocaleKeys.password.tr(),
                  fillColor: AppColors.textFieldColor,
                  hintTextStyle: AppTextStyle.greyW600S13,
                  prefixIcon: Icons.lock_outline,
                  prefixColor: AppColors.greyColor,
                  obscureText: !isPasswordVisible,
                  suffixIcon: isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  suffixColor: AppColors.greyColor,
                  suffixOnPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.validatePassword,
                ),
                const CustomHeightSpacingWidget(height: 16),
                TermAndCondations(
                  onChanged: (value) {
                    setState(() {
                      isTermsAccepted = value;
                    });
                  },
                ),
                const CustomHeightSpacingWidget(height: 30),
                CustomButtonWidget(
                  title: LocaleKeys.createAcc.tr(),
                  titleStyle: AppTextStyle.whiteW700S16,
                  buttonColor: AppColors.primaryColor,
                  buttonHeight: 54.h,
                  buttonWidth: double.infinity,
                  borderRadiusButton: 12.r,
                  borderSideColor: AppColors.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                const CustomHeightSpacingWidget(height: 26),
                const AlreadyHaveAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
