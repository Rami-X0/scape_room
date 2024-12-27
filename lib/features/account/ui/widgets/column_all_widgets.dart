
import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/features/account/ui/widgets/form_account.dart';
import 'package:scape_room/features/account/ui/widgets/login_and_sign_up_button.dart';
import 'package:scape_room/features/account/ui/widgets/state_have_account.dart';
import 'package:scape_room/features/account/ui/widgets/welcome_back_and_started_text.dart';

class ColumnAllWidgets extends StatelessWidget {
  const ColumnAllWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeBackAndStartedText(),
        context.verticalSpace(context.height * 0.04),
        const FormAccount(),
        context.verticalSpace(context.height * 0.04),
        const LoginAndSignUpButton(),
        context.verticalSpace(context.height * 0.04),
        const StateHaveAccount(),
      ],
    );
  }
}
