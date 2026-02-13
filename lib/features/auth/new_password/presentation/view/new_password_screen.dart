import 'package:accessories_store/Features/auth/new_password/data/repo/reset_password/reset_password_implementation_repo.dart';
import 'package:accessories_store/Features/auth/new_password/presentation/cubit/reset_password/cubit/reset_password_cubit.dart';
import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/shared_widgets/custom_app_bar_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_arrow_back_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/new_password/presentation/view/widgets/reset_password_body.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(resetPasswordRepo: RestPasswordImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: CustomAppBarWidget(
            title: LocaleKeys.resetPassword.tr(),
            leading: CustomArrowBackWidget(
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        body: ResetPasswordBody(email: email, otp: otp),
    )
    );
  }
}
