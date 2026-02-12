import 'package:accessories_store/core/methods/custom_animated_snack_bar.dart';
import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/cubit/verify_otp_cubit/cubit/verify_otp_cubit.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpButton extends StatefulWidget {
  const VerifyOtpButton({super.key, required this.email, required this.otpController, required this.formKey});
  final String email;
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;

  @override
  State<VerifyOtpButton> createState() => _VerifyOtpButtonState();
}

class _VerifyOtpButtonState extends State<VerifyOtpButton> {
  @override
  void dispose() {
    widget.otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpFailureState) {
          CustomAnimatedShowSnackBar.failureSnackBar(context: context, message: state.message);
        }
        else if (state is VerifyOtpSuccessState) {
          CustomAnimatedShowSnackBar.successSnackBar(context: context, message: LocaleKeys.codeVerificationSuccess.tr());
          context.pushNamed(AppRoutes.newPasswordScreen,extra: {
            "email": widget.email,
            "otp": widget.otpController.text.trim(),
          });
        }
      },
      builder: (context, state) {
        return CustomButtonWidget(
  buttonWidth: double.infinity,
  title: LocaleKeys.verifyButton.tr(),

  borderSideColor: widget.otpController.text.trim().length != 6 ||
          state is VerifyOtpLoadingState
      ? AppColors.borderTextFieldColor
      : AppColors.primaryColor,

  buttonColor: widget.otpController.text.trim().length != 6 ||
          state is VerifyOtpLoadingState
      ? AppColors.borderTextFieldColor
      : AppColors.primaryColor,

  onPressed: widget.otpController.text.trim().length == 6 &&
          state is! VerifyOtpLoadingState
      ? () {
          if (widget.formKey.currentState!.validate()) {
            context.read<VerifyOtpCubit>().verifyOtp(
                  email: widget.email,
                  otp: widget.otpController.text.trim(),
                );
          }
        }
      : null,

  child: state is VerifyOtpLoadingState
      ? CustomLoadingWidget(
          color: AppColors.whiteColor,
          strokeAlign: -1,
          strokeWidth: 2,
          cicleHeight: 25,
          cicleWidth: 25,
        )
      : null,
)
;
      },
    );
  }
}
