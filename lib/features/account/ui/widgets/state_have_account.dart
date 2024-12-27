import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/theming/styles.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';

class StateHaveAccount extends StatefulWidget {
  const StateHaveAccount({super.key});

  @override
  State<StateHaveAccount> createState() => _StateHaveAccountState();
}

class _StateHaveAccountState extends State<StateHaveAccount> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AccountCubit.isLogin
                ? 'Don\'t have an account? '
                : 'Already have an account? ',
            style: TextStyles.fontBlackMedium09Percent(context)
                .copyWith(fontSize: context.width * 0.04 - 2),
          ),
          TextSpan(
            text: AccountCubit.isLogin ? 'SignUp' : 'Login',
            style: TextStyles.fontWhiteMedium4Percent(context)
                .copyWith(color: AppColors.defaultColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AccountCubit.isLogin
                    ? context.pushAndRemove(Routes.login)
                    : context.pushAndRemove(Routes.signUp);
                setState(() {
                  AccountCubit.emailController.clear();
                  AccountCubit.passwordController.clear();
                  AccountCubit.nameController.clear();
                  AccountCubit.phoneNumberController.clear();
                  AccountCubit.isLogin = !AccountCubit.isLogin;
                });
              },
          ),
        ],
      ),
    );
  }
}
