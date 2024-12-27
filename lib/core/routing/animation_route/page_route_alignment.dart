import 'package:flutter/material.dart';
import 'package:scape_room/core/theming/app_colors.dart';

class PageRouteFade extends PageRouteBuilder {
  final Widget child;

  PageRouteFade({required this.child})
      : super(

    pageBuilder: (context, animation, secondaryAnimation) => child,

          barrierColor: AppColors.defaultColor.withOpacity(0.3),
    transitionDuration:  const Duration(milliseconds: 450),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },

  );
}
