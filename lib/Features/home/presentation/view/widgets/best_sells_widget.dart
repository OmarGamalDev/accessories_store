import 'package:accessories_store/core/shared_widgets/custom_text_button_widget.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BestSellsWidget extends StatelessWidget {
  const BestSellsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButtonWidget(onPressed: (){},title: LocaleKeys.bestSells.tr(), textStyle: AppTextStyle.blackW700S16,),
        CustomTextButtonWidget(onPressed: (){},title: LocaleKeys.more.tr(), textStyle: AppTextStyle.greyW400S13,),
      ],
    );
  }
}
