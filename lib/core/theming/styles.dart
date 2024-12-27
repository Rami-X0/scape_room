
import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle fontWhiteMedium4Percent(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: context.width * 0.04 - 3,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle fontBlackMedium09Percent(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontWeight: FontWeightHelper.bold,
      fontSize: context.width * 0.09,
    );
  }

  static TextStyle fontGrayMedium5Percent(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontWeight: FontWeightHelper.medium,
      fontSize: context.width * 0.05 - 1,
    );
  }
}
