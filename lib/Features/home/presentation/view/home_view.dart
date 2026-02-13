import 'package:accessories_store/Features/home/presentation/view/widgets/home_view_body.dart';
import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: HomeViewBody(),
    );
  }
}
