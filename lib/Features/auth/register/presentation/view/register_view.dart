import 'package:accessories_store/Features/auth/register/data/repos/register_repo_impl.dart';
import 'package:accessories_store/Features/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:accessories_store/Features/auth/register/presentation/view/widgets/register_view_body.dart';
import 'package:accessories_store/core/network/dio_consumer.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImpl(DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: RegisterViewBody(),
      ),
    );
  }
}
