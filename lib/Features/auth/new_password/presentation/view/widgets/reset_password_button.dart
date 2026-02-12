import 'package:accessories_store/core/methods/custom_animated_snack_bar.dart';
import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/features/auth/new_password/presentation/cubit/reset_password/cubit/resetPassword_cubit.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordButton extends StatefulWidget {
  const ResetPasswordButton({
    super.key,
    required this.passwordController,
    required this.email,
    required this.otp,
    required this.formKey,
  });
  final TextEditingController passwordController;
  final String email;
  final String otp;
  final GlobalKey<FormState> formKey;

  @override
  State<ResetPasswordButton> createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  @override
  void dispose() {
    widget.passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailureState) {
          CustomAnimatedShowSnackBar.failureSnackBar(
            context: context,
            message: state.message,
          );
        } else if (state is ResetPasswordSuccessState) {
          showDialog(
            barrierDismissible: false,
            animationStyle: AnimationStyle(
              curve: Curves.easeOutBack,
              reverseCurve: Curves.easeIn,
              duration: Duration(seconds: 4),
              reverseDuration: Duration(seconds: 4),
            ),
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColors.whiteColor,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      "assets/lotties/Done _ Correct _ Tick.json",
                      height: 200.sp,
                      width: 200.sp,
                      fit: BoxFit.cover,
                    ),
                    CustomHeightSpacingWidget(height: 25),
                    Text(
                      state.message,
                      style: AppTextStyle.blackW600S16,
                    ),
                  ],
                ),
              );
            },
          );
          Future.delayed(Duration(seconds: 4), () {
            if (context.mounted) {
              Navigator.of(context).pop(); // نقفل الديالوج
              GoRouter.of(context).go(AppRoutes.loginScreen); // ميرجعش تاني ) نروح للوجين
            }
          });
        }
      },
      builder: (context, state) {
        return CustomButtonWidget(
          buttonWidth: double.infinity,
          buttonColor: state is ResetPasswordLoadingState
              ? AppColors.borderTextFieldColor
              : AppColors.primaryColor,
          borderSideColor: state is ResetPasswordLoadingState
              ? AppColors.borderTextFieldColor
              : AppColors.primaryColor,
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              context.read<ResetPasswordCubit>().resetPassword(
                email: widget.email,
                otp: widget.otp,
                password: widget.passwordController.text.trim(),
              );
            }
          },
          title: LocaleKeys.newPassButton.tr(),
          child: state is ResetPasswordLoadingState
              ? const CustomLoadingWidget(
                  cicleHeight: 24,
                  cicleWidth: 24,
                  strokeAlign: -1,
                  strokeWidth: 2,
                  color: AppColors.whiteColor,
                )
              : null,
        );
      },
    );
  }
}
