import 'package:accessories_store/Features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:accessories_store/Features/auth/login/presentation/view/widgets/donot_have_account.dart';
import 'package:accessories_store/Features/auth/login/presentation/view/widgets/forget_password_widget.dart';
import 'package:accessories_store/Features/auth/login/presentation/view/widgets/login_with_google.dart';
import 'package:accessories_store/Features/auth/login/presentation/view/widgets/or_widget.dart';
import 'package:accessories_store/core/methods/app_snack_bar.dart';
import 'package:accessories_store/core/services/input_validator.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_text_field_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isTermsAccepted = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AppSnackBar.showSuccess(
            message: LocaleKeys.loginSuccessful.tr(),
            context: context,
            position: SnackBarPosition.top,
          );
        } else if (state is LoginError) {
          AppSnackBar.showError(
            title: LocaleKeys.loginFailed.tr(),
            message: state.message,
            context: context,
            position: SnackBarPosition.top,
          );
        } else {}
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomHeightSpacingWidget(height: 20),
                    Text(
                      LocaleKeys.login.tr(),
                      style: AppTextStyle.blackW700S19,
                    ),
                    const CustomHeightSpacingWidget(height: 24),
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
                    const ForgetPasswordWidget(),
                    const CustomHeightSpacingWidget(height: 33),
                    CustomButtonWidget(
                      title: isLoading ? '' : LocaleKeys.login.tr(),
                      titleStyle: AppTextStyle.whiteW700S16,
                      buttonColor: AppColors.primaryColor,
                      buttonHeight: 54.h,
                      buttonWidth: double.infinity,
                      borderRadiusButton: 12.r,
                      borderSideColor: AppColors.primaryColor,
                      onPressed: isLoading ? null : handleLogin,
                      child: isLoading
                          ? SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: CustomLoadingWidget(
                                color: AppColors.whiteColor,
                                strokeWidth: 3.w,
                              ),
                            )
                          : null,
                    ),
                    const CustomHeightSpacingWidget(height: 26),
                    const DonotHaveAccount(),
                    const CustomHeightSpacingWidget(height: 37),
                    const OrWidget(),
                    const CustomHeightSpacingWidget(height: 16),
                    const LoginWithGoogle(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handleLogin() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<LoginCubit>().login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
  }
}
