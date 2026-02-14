import 'package:accessories_store/core/methods/custom_animated_snack_bar.dart';
import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/shared_widgets/custom_button_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/forgot_password/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.formKey, required this.emailController});
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailureState) {
          CustomAnimatedShowSnackBar.failureSnackBar(context: context, message: state.errorMessage);
        }
        else if (state is ForgotPasswordSuccessState) {
          CustomAnimatedShowSnackBar.successSnackBar(context: context, message: LocaleKeys.sentOtpSuccess.tr());
          context.pushNamed(AppRoutes.verifyOtpScreen,extra: emailController.text.trim());
        }
        
      },
      builder: (context, state) {
        return CustomButtonWidget(
          onPressed: () {
            if(formKey.currentState!.validate()){
              context.read<ForgotPasswordCubit>().forgotPassword(email: emailController.text.trim());
            }
          },
          buttonWidth: double.infinity,
          borderSideColor: state is ForgotPasswordLoadingState
              ? AppColors.borderTextFieldColor
              : AppColors.primaryColor,
          buttonColor: state is ForgotPasswordLoadingState
              ? AppColors.borderTextFieldColor
              : AppColors.primaryColor,
          title: LocaleKeys.verifyAppbar.tr(),
          child: state is ForgotPasswordLoadingState
              ? CustomLoadingWidget(color: AppColors.whiteColor,strokeAlign: -1,strokeWidth: 2,cicleHeight: 25,cicleWidth: 25,)
              : null,
        );
      },
    );
  }
}
