import 'dart:async';

import 'package:accessories_store/core/methods/custom_animated_snack_bar.dart';
import 'package:accessories_store/core/shared_widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_text_button_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/cubit/resend_otp/cubit/resend_otp_cubit.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton({super.key, required this.email});
  final String email;

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  int _resendSeconds = 60;
  Timer? _resendTimer;
  bool _canResend = true;
  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _canResend = false;
    _resendSeconds = 60;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendSeconds > 0) {
        setState(() => _resendSeconds--);
      } else {
        setState(() => _canResend = true);
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) {
        if (state is ResendOtpFailureState) {
          CustomAnimatedShowSnackBar.failureSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Text(
              !_canResend ? "( $_resendSeconds ${LocaleKeys.second.tr()} )" : LocaleKeys.clickToResend.tr(),
              style: AppTextStyle.greyW400S13, 
            ),
            CustomTextButtonWidget(
              onPressed: (!_canResend || state is ResendOtpLoadingState)
                  ? null
                  : () {
                      context.read<ResendOtpCubit>().resendOtp(email: widget.email);
                      _startResendTimer();
                    },
              title: LocaleKeys.verifyAgain.tr(),
              child: state is ResendOtpLoadingState
                  ? CustomLoadingWidget(
                      cicleHeight: 20,
                      cicleWidth: 20,
                      color: AppColors.lightGreenColor,
                      strokeAlign: -1,
                      strokeWidth: 2,
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}
