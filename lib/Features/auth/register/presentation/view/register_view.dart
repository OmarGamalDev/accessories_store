import 'package:accessories_store/Features/auth/register/presentation/view/widgets/register_view_body.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: RegisterViewBody()
    );
  }
}
