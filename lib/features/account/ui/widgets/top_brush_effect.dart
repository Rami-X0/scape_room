
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/helper/spacing.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/theming/font_weight_helper.dart';
import 'package:scape_room/core/theming/styles.dart';

class TopBrushEffect extends StatelessWidget {
  const TopBrushEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          _buildBrushContainer(context),
          // _buildTextDontHaveAccount(context),
          // _buildTextChatApp(context),
         ],
      ),
    );
  }

  Widget _buildTextChatApp(BuildContext context) {
    return Positioned(
      top: context.height * 0.10,
      left: context.width * 0.10,
      child: CircleAvatar(
maxRadius: 65,
        backgroundColor: Colors.white.withOpacity(0.1),
        child: Center(
          child: Text(
            'Chat App',
            style: TextStyles.fontWhiteMedium4Percent(context).copyWith(
              fontSize: context.width / 13,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrushContainer(BuildContext context) {
    return Container(
      width: context.width * 0.7,
      height: context.height * 0.26,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            spreadRadius: context.width * 0.06,
            blurRadius: context.width * 0.15,
            offset: const Offset(30, -20),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.width * 0.22),
          bottomLeft: Radius.circular(context.width * 0.22),
        ),
      ),
    );
  }

  Widget _buildTextDontHaveAccount(BuildContext context) {
    return Positioned(
      bottom: context.height * 0.15,
      right: context.width / 20,
      child: Row(
        children: [
          Text(
            'Dont`t have an account?',
            style: TextStyles.fontWhiteMedium4Percent(context),
          ),
          horizontalSpace(context.width * 0.06),
          Container(
            width: context.width / 5,
            height: context.height / 25,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(
                colorSpace:ColorSpace.extendedSRGB,
                alpha: 0.3,

              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Get Started',
                style: TextStyles.fontWhiteMedium4Percent(context)
                    .copyWith(fontSize: context.width / 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
