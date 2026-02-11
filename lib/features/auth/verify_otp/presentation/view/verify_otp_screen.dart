import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/shared_widgets/custom_app_bar_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_arrow_back_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/verify_otp/data/repo/resend_otp_repo/resend_otp_implementation_repo.dart';
import 'package:accessories_store/features/auth/verify_otp/data/repo/verify_otp_repo/verify_otp_implementation_repo.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/cubit/resend_otp/cubit/resend_otp_cubit.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/cubit/verify_otp_cubit/cubit/verify_otp_cubit.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/widgets/verify_otp_body.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VerifyOtpCubit(verifyOtpRepo: VerifyOtpImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),),
        BlocProvider(create: (context) => ResendOtpCubit(resendOtpRepo: ResendOtpImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),)
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
        body: VerifyOtpBody(email: email),
      ),
    );
  }
}
