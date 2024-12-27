import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;
}

extension NavigatorExtension on BuildContext {
  void pop() => Navigator.pop(this);

  void push(String name) => Navigator.pushNamed(this, name);

  void pushAndRemove(String name) =>
      Navigator.pushNamedAndRemoveUntil(this, name, (route) => false);
}

extension SizedBoxExtension on BuildContext {
  SizedBox verticalSpace(double height) => SizedBox(height: height);

  SizedBox horizontalSpace(double width) => SizedBox(height: width);
}
