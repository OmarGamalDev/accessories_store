import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/shared_widgets/custom_app_bar_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_arrow_back_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/verify_email/data/repo/verify_email_repo/verify_email_implementation_repo.dart';
import 'package:accessories_store/features/auth/verify_email/presentation/cubit/verify_email/verify_email_cubit.dart';
import 'package:accessories_store/features/auth/verify_email/presentation/view/widgets/verify_email_body.dart';
import 'package:accessories_store/features/auth/verify_otp/data/repo/resend_otp_repo/resend_otp_implementation_repo.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/cubit/resend_otp/cubit/resend_otp_cubit.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => VerifyEmailCubit(verifyEmailRepo: VerifyEmailImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),),
        BlocProvider(
      create: (context) => ResendOtpCubit(resendOtpRepo: ResendOtpImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),)
      ],
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: CustomAppBarWidget(
            title: LocaleKeys.verifyButton.tr(),
            leading: CustomArrowBackWidget(
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        body: VerifyEmailBody(email: email),
      ),
    );
  }
}
