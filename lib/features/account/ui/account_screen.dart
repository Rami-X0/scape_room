import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_scaffold.dart';
import 'package:scape_room/features/account/ui/widgets/bloc_listener__customer_create_account.dart';
import 'package:scape_room/features/account/ui/widgets/container_home_login.dart';
import 'package:scape_room/features/account/ui/widgets/top_brush_effect.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.defaultColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/scape_room_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBrushEffect(),
              context.verticalSpace(context.height * 0.090),
              const ContainerHomeLogin(),
              const BlocListenerCustomerCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
