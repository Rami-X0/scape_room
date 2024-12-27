
import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/helper/spacing.dart';
import 'package:scape_room/core/theming/styles.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';

class WelcomeBackAndStartedText extends StatelessWidget {
  const WelcomeBackAndStartedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(context.height * 0.04),
        Text(
          AccountCubit.isLogin ? 'Welcome Back!' : 'Join Us',
          style: TextStyles.fontBlackMedium09Percent(context),
        ),
        verticalSpace(context.height * 0.01),
        Text(
          AccountCubit.isLogin
              ? 'Enter your details below'
              : 'Get started free',
          style: TextStyles.fontGrayMedium5Percent(context),
        ),
      ],
    );
  }
}
