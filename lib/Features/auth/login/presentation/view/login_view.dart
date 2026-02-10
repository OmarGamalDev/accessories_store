import 'package:accessories_store/Features/auth/login/data/repos/login_repo_impl.dart';
import 'package:accessories_store/Features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:accessories_store/Features/auth/login/presentation/view/widgets/login_view_body.dart';
import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl(DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: LoginViewBody(),
      ),
    );
  }
}
