import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';
import 'package:scape_room/features/account/ui/widgets/column_all_widgets.dart';

class ContainerHomeLogin extends StatelessWidget {
  const ContainerHomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AccountCubit.isLogin == true
          ? context.height * 0.65
          : context.height * 0.75,
      width: context.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        // fit: StackFit.expand,
        children: [
          _buildContainerOpacity(context),
          Positioned(
            top: context.height * 0.02 ,
            child: Container(
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.width * 0.07),
                  topRight: Radius.circular(context.width * 0.07),
                ),
              ),
              child: const ColumnAllWidgets(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerOpacity(BuildContext context) {
    return Container(
      width: context.width * 0.87,
      height: context.height,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(
          colorSpace: ColorSpace.extendedSRGB,
          alpha: 0.3,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.width * 0.05),
          topRight: Radius.circular(context.width * 0.05),
        ),
      ),
    );
  }
}
