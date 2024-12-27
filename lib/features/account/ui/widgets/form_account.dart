import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_text_form_field.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';
import 'package:scape_room/features/account/ui/widgets/icon_show_password.dart';

class FormAccount extends StatefulWidget {
  const FormAccount({super.key});

  @override
  State<FormAccount> createState() => _FormAccountState();
}

bool _isPassword = true;

class _FormAccountState extends State<FormAccount> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value:  getIt<AccountCubit>(),
  child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.020),
      child: AccountCubit.isLogin
          ? Form(
              key: context.read<AccountCubit>().formKey,
              child: Column(
                spacing: 13.h,
                children: [
                  AppTextFormField(
                    fillColor: AppColors.white,
                    hintText: 'Email Address',
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      size: context.width * 0.050,
                      color: AppColors.defaultColor,
                    ),
                    validator: (value) {
                      return _validatorEmail(value);
                    },
                    controller: AccountCubit.emailController,
                  ),
                  AppTextFormField(
                    fillColor: AppColors.white,
                    maxLines: 1,
                    hintText: 'Password',
                    suffixIcon: IconShowPassword(
                      isShowPassword: _isPassword,
                      onPressed: _showPassword,
                    ),
                    obscureText: _isPassword,

                    validator: (value) {
                      return _validatorPassword(value);
                    },
                    controller: AccountCubit.passwordController,
                  ),
                ],
              ),
            )
          : Form(
              key: context.read<AccountCubit>().formKey,
              child: Column(
                spacing: 13.h,
                children: [
                  AppTextFormField(
                    fillColor: AppColors.white,
                    hintText: 'Name',
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.userLarge,
                      size: context.width * 0.050,
                      color: AppColors.defaultColor,
                    ),
                    validator: (value) {
                      return _validatorName(value);
                    },
                    controller: AccountCubit.nameController,
                  ),
                  AppTextFormField(
                    fillColor: AppColors.white,
                    hintText: 'Email Address',
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      size: context.width * 0.050,
                      color: AppColors.defaultColor,
                    ),
                    validator: (value) {
                      return _validatorEmail(value);
                    },
                    controller: AccountCubit.emailController,
                  ),
                  AppTextFormField(
                    fillColor: AppColors.white,
                    hintText: 'Phone Number',
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.phone,
                      size: context.width * 0.050,
                      color: AppColors.defaultColor,
                    ),
                    validator: (value) {
                      return _validatorPhoneNumber(value);
                    },
                    controller: AccountCubit.phoneNumberController,
                  ),
                  AppTextFormField(
                    fillColor: AppColors.white,
                    maxLines: 1,
                    hintText: 'Password',
                    suffixIcon: IconShowPassword(
                      isShowPassword: _isPassword,
                      onPressed: _showPassword,
                    ),
                    obscureText: _isPassword,
                    validator: (value) {
                      return _validatorPassword(value);
                    },
                    controller: AccountCubit.passwordController,
                  ),
                ],
              ),
            ),
    ),
);
  }

  _showPassword() => setState(
        () => _isPassword = !_isPassword,
      );

  String? _validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? _validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validatorPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    return null;
  }

  String? _validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
