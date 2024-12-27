import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/helper/spacing.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/theming/styles.dart';
import 'package:scape_room/core/widgets/app_elevated_button.dart';
import 'package:scape_room/core/widgets/app_dialog.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';
import 'package:scape_room/features/account/cubit/account_state.dart';
import 'package:scape_room/features/account/ui/account_screen.dart';

class BlocListenerCustomerCreateAccount extends StatefulWidget {
  const BlocListenerCustomerCreateAccount({super.key});

  @override
  State<BlocListenerCustomerCreateAccount> createState() =>
      _BlocListenerCustomerCreateAccountState();
}

ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);

class _BlocListenerCustomerCreateAccountState
    extends State<BlocListenerCustomerCreateAccount> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountInitialState>(
      listener: (context, state) {
        if (state is CustomerCreateAccountLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return _loadingAndSuccessDialog(_isLoading);
            },
          );
        }

        else if (state is CustomerCreateAccountSuccessState) {
          print('Successssss');
        AccountCubit.emailController.clear();
        AccountCubit.phoneNumberController.clear();
        AccountCubit.passwordController.clear();
        AccountCubit.nameController.clear();
          AccountCubit.isLogin=true;
          context.pushAndRemove(Routes.login);
        } else if (state is CustomerCreateAccountFailureState) {
          Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return AppDialog(
                padding: 0,
                child: _errorDialog(state.failure.getAllMessages(), context),
              );
            },
          );
        }else if(state is CustomerLoginLoadingState){
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return _loadingAndSuccessDialog(_isLoading);
            },
          );
        }else if(state is CustomerLoginFailureState){
     Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return AppDialog(
                padding: 0,
                child: _errorDialog('Invalid login attempt', context),
              );
            },
          );
        }else if(state is CustomerLoginSuccessState){
          context.pushAndRemove(Routes.home);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  // void stateIsLoading(BuildContext context) {
  //   _isLoading.value = false;
  //   Future.delayed(Duration(milliseconds: 1000), () {
  //     _isLoading.value = true;
  //
  //     if (context.mounted) {
  //       Navigator.pop(context);
  //     }
  //   });
  // }

  Widget _loadingAndSuccessDialog(ValueNotifier<bool> isLoading) {
    return AppDialog(
      padding: 100,
      height: 170,
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: value
                ? AppLoading(key: ValueKey('Loading'))
                : Center(
              key: ValueKey('Success'),
              child: FaIcon(
                FontAwesomeIcons.solidCircleCheck,
                color: AppColors.defaultColor,
                size: 100.w,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _errorDialog(String message, BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: Text(
            message,
            textAlign: TextAlign.start,
            style: TextStyles.fontBlackMedium09Percent(context)
                .copyWith(fontSize: 14.sp),
          ),
        ),
        AppElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'okay',
          backgroundColor: AppColors.defaultColor,
          width: 300,
        ),
        verticalSpace(10),
      ],
    );
  }
}
