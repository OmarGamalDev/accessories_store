import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/core/utilies/app_colors.dart';
import 'package:accessories_store/core/methods/custom_awesome_snack_bar.dart';
import 'package:accessories_store/core/widgets/custom_divider_widget.dart';
import 'package:accessories_store/core/widgets/custom_loading_widget.dart';
import 'package:accessories_store/core/methods/custom_animated_snack_bar.dart';
import 'package:accessories_store/core/widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/widgets/custom_switch_widget.dart';
import 'package:accessories_store/core/widgets/failure_widget.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/custom_shimmer_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

bool setLanguage = false;
class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("data"),
        actions: [
          CustomSwitchWidget(value: setLanguage,onChanged: (v){
            setState(() {
              setLanguage = v;
              setLanguage ? context.setLocale(Locale("ar")) : context.setLocale(Locale("en")); 
            });
          },),
        ],
      ),
      body: Column(
        children: [
          Text(LocaleKeys.set1),
          TextButton(onPressed: (){
            GoRouter.of(context).pushNamed(AppRoutes.searchScreen);
          }, child: Text("Navigate")),
          TextButton(onPressed: (){
            CustomAwesomeSnackBarWidget.showWarningSnackBar(context, "dkjgjsndksnghslgkd",);
            CustomAnimatedShowSnackBar.successSnackBar(context: context, message: "ngkendfgskdlnfnshdzngdx");

          }, child: Text("SnackBar")),
          CustomLoadingWidget(),
          CustomHeightSpacingWidget(height: 30),
          FailureWidget(text: "Ops Error"),
          CustomHeightSpacingWidget(height: 30),
          CustomDividerWidget(),
          CustomHeightSpacingWidget(height: 30),
          CustomShimmerContainerWidget(height: 174, width: 161, radius: 10),
        ],
      ),
    );
  }
}
