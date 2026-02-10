import 'package:accessories_store/Features/auth/login/presentation/view/widgets/login_view_body.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: LoginViewBody(),
    );
  }
}
