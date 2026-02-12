import 'package:accessories_store/Features/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:accessories_store/Features/auth/register/presentation/view/widgets/already_have_account.dart';
import 'package:accessories_store/Features/auth/register/presentation/view/widgets/term_and_condations.dart';
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

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isTermsAccepted = false;
  bool isLoading = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
        } else if (state is RegisterSuccess) {
          AppSnackBar.showSuccess(message: state.message, context: context);
        } else if (state is RegisterError) {
          AppSnackBar.showError(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;
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
                      LocaleKeys.signUp.tr(),
                      style: AppTextStyle.blackW700S19,
                    ),
                    const CustomHeightSpacingWidget(height: 24),
                    CustomTextFieldWidget(
                      controller: firstNameController,
                      hintText: LocaleKeys.firstName.tr(),
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    const CustomHeightSpacingWidget(height: 16),
                    CustomTextFieldWidget(
                      controller: lastNameController,
                      hintText: LocaleKeys.lastName.tr(),
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    const CustomHeightSpacingWidget(height: 16),
                    CustomTextFieldWidget(
                      controller: emailController,
                      hintText: LocaleKeys.email.tr(),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
                    ),
                    const CustomHeightSpacingWidget(height: 16),
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: LocaleKeys.password.tr(),
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
                      title: isLoading ? '' : LocaleKeys.createAcc.tr(),
                      titleStyle: AppTextStyle.whiteW700S16,
                      buttonColor: isLoading
                          ? AppColors.borderTextFieldColor
                          : isTermsAccepted
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      buttonHeight: 54.h,
                      buttonWidth: double.infinity,
                      borderRadiusButton: 12.r,
                      borderSideColor: isLoading
                          ? AppColors.borderTextFieldColor
                          : isTermsAccepted
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      onPressed: isLoading ? null : handleRegister,
                      child: isLoading
                          ? CustomLoadingWidget(
                              color: AppColors.whiteColor,
                              strokeAlign: -1,
                              strokeWidth: 2,
                              cicleHeight: 25,
                              cicleWidth: 25,
                            )
                          : null,
                    ),
                    const CustomHeightSpacingWidget(height: 26),
                    const AlreadyHaveAccountWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handleRegister() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!isTermsAccepted) {
      AppSnackBar.showWarning(
        message: LocaleKeys.termCon1.tr(),
        context: context,
      );
      return;
    }
    context.read<RegisterCubit>().register(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
    );
  }
}
