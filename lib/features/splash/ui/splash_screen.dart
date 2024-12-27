import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scape_room/core/caching/app_shared_pref_key.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: AppColors.defaultColor,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_image.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                repeatForever: false,
                animatedTexts: [
                  _defaultText(),
                ],
                onFinished: () {
                  token == null
                      ? context.pushAndRemove(Routes.login)
                      : context.pushAndRemove(Routes.home);
                },
              ),
            )));
  }

  WavyAnimatedText _defaultText() {
    return WavyAnimatedText(
      speed: Duration(milliseconds: 150),
      'Scape Room',
      textStyle: TextStyle(
        shadows: <Shadow>[
          Shadow(
            offset: Offset(-10, 10.0),
            blurRadius: 25,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ],
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: 65.sp,
      ),
    );
  }
}
