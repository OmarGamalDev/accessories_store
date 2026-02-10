import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/shared_widgets/custom_app_bar_widget.dart';
import 'package:accessories_store/core/shared_widgets/custom_arrow_back_widget.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/auth/forgot_password/data/repo/forgot_password_repo/forgot_password_implementation_repo.dart';
import 'package:accessories_store/features/auth/forgot_password/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:accessories_store/features/auth/forgot_password/presentation/view/widgets/forgot_password_body.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(forgotPasswordRepo: ForgotPasswordImplementationRepo(apiConsumer: DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          flexibleSpace: CustomAppBarWidget(
            title: LocaleKeys.verifyAppbar.tr(),
            leading: CustomArrowBackWidget(
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        body: ForgotPasswordBody(),
      ),
    );
  }
}
