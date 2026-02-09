import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key, required this.value, this.onChanged, this.activeThumbColor, this.inactiveThumbColor, this.activeTrackColor, this.inactiveTrackColor, this.overlayColor, this.trackOutlineColor, this.trackOutlineWidth});
  final bool value;
  final void Function(bool)? onChanged;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<double?>? trackOutlineWidth;
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeThumbColor: activeThumbColor??AppColors.primaryColor,
        activeTrackColor: activeTrackColor??AppColors.lemonColor,
        inactiveThumbColor: inactiveThumbColor??AppColors.whiteColor,
        inactiveTrackColor: inactiveTrackColor??AppColors.borderTextFieldColor,
        overlayColor: overlayColor??WidgetStatePropertyAll(Colors.transparent),
        trackOutlineColor: trackOutlineColor??WidgetStatePropertyAll(AppColors.primaryColor),
        trackOutlineWidth: trackOutlineWidth??WidgetStatePropertyAll(1.5),
        value: value, onChanged: onChanged
    );
  }
}
