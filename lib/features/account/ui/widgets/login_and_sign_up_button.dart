import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_elevated_button.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';

class LoginAndSignUpButton extends StatelessWidget {
  const LoginAndSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.defaultColor,
            AppColors.secondColor,
          ],
        ),
        borderRadius: BorderRadius.circular(context.width * 0.02),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(
              alpha: 0.4,
              colorSpace: ColorSpace.displayP3,
            ),
            spreadRadius: context.height * 0.01 - 15,
            blurRadius: context.height * 0.011,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: AppElevatedButton(
        width: context.width * 0.95,
        backgroundColor: Colors.transparent.withOpacity(0),
        shadowColor: Colors.transparent.withOpacity(0),
        onPressed: () {
          if (context
              .read<AccountCubit>()
              .formKey
              .currentState!
              .validate()) {
            AccountCubit.isLogin
                ? context.read<AccountCubit>().customerLogin()
                : context
                .read<AccountCubit>()
                .customerCreateAccount();
          }
        },
        text: AccountCubit.isLogin ? 'Login' : 'Sign Up',
      ),
    );
  }
}
